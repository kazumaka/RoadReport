class Admin::PostsController < ApplicationController
  def top
    @posts = Post.page(params[:page])
  end

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @map = @post.map
  end

  def list
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_root_path
    else
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:is_active)
  end
end
