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
      map.save
      redirect_to posts_path
    else
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

  end

  def update

  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:post_name, :introduction, :road_name, :image, map_attributes: [:address]).merge(user_id: current_user.id)
  end
end
