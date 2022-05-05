class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page])
  end
end
