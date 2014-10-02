class NeighborhoodsController < ApplicationController
  def index
  end

  def show
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @city = City.find(1)

  end
end
