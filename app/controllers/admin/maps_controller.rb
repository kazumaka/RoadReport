class Admin::MapsController < ApplicationController
  def index
    @maps = Map.all
  end
end
