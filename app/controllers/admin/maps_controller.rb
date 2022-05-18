class Admin::MapsController < ApplicationController
  def index
    @maps = Map.all
    if params[:id].present?
    @post = Post.find(params[:id])
    end
  end
end
