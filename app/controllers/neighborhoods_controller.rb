class NeighborhoodsController < ApplicationController

  def index
  end

  def show
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @area = Neighborhood.friendly.find(params[:id])
    @establishments = Establishment.real
  end
end
