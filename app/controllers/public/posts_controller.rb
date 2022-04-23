class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  
  def new
    @post = Post.new
    @post.build_spot
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
       redirect_to root_path
    else
      @post = Post.new
      render :new
    end
  end

  def index
    
  end
  
  def list
    
  end

  def show
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    
  end
  
  def update
    
  end
  
  def destr
    
  end
  
  private
  def post_params
    params.require(:post).permit(:post_name, :introduction, :road_name, :image,spot_attributes: [:address])
  end
end
