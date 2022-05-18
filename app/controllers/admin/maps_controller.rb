class Admin::MapsController < ApplicationController
  def index
    @maps = Map.all
    @post = Post.find(params[:id])
  end
end
