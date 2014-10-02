class NeighborhoodsController < ApplicationController
  def index
  end

  def show
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @neighborhood = Neighborhood.find_by(params[:search])
  end
end
