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
       redirect_to posts_path
    else
      @post = Post.new
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
    @map = Map.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destr

  end

  private
  def post_params
    params.require(:post).permit(:post_name, :introduction, :road_name, :image,map_attributes: [:id, :address, :latitude, :longitude]).merge(user_id: current_user.id)
 end
end
