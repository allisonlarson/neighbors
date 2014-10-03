class NeighborhoodsController < ApplicationController
  def index
  end

  def show
    @zoom = 0
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @area = Neighborhood.find(params[:id])
  end
end
