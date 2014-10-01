class NeighborhoodsController < ApplicationController
  def index
  end

  def show
    @neighborhood = Neighborhood.find_by(params[:search])
  end
end
