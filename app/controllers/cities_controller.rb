class CitiesController < ApplicationController
  def show
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @area = City.find(params[:id])
    @neighborhood_area = @area.neighborhoods.map {|n| n.coordinates }
  end
end
