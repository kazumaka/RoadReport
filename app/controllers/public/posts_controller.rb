class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:index]

  def new
    @post = Post.new
    @post.build_map
    @maps = Map.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      map = Map.new(post_id: @post.id)
      map.address = params[:map][:address]
      # binding.pry
      map.save
      redirect_to posts_path
    else
      binding.pry
      @post = Post.news
      @post.build_map
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def list

  end

  def show
    @post = Post.find(params[:id])
    @map = @post.map
  end

  def edit
    @post = Post.find(params[:id])
    @map = @post.map
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post_name, :introduction, :road_name, :image, map_attributes: [:address]).merge(user_id: current_user.id)
  end
end
