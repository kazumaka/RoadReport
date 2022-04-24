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
       redirect_to root_path
    else
      @post = Post.new
      @post.build_map
      render :new
    end
  end

  def index

  end

  def list

  end

  def show

  end

  def edit

  end

  def update

  end

  def destr

  end

  private
  def post_params
    params.require(:post).permit(:post_name, :introduction, :road_name, :image,map_attributes: [:id, :address, :latitude, :longitude])
  end
end
