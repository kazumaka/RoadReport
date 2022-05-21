class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]

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
      @post = Post.new
      @post.build_map
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page])
  end

  def list
    @user = current_user
    @posts = @user.posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @map = @post.map
    gon.lat = @map.latitude
    gon.lng = @map.longitude
    @post_comment = PostComment.new
  end

  before_action :ensure_current_user, {only: [:edit, :update]}

  def ensure_current_user
   if current_user.id != Post.find(params[:id]).user_id
     redirect_to posts_path
   end
  end

  def edit
    @post = Post.find(params[:id])
    @map = @post.map
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @map = @post.map
      @map.address = params[:map][:address]
      @map.update(map_params)
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

  def map_params
    params.require(:map).permit(:adrress, :latitude, :longitude)
  end
end
