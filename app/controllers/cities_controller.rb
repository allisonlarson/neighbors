class CitiesController < ApplicationController
  def show
    @zoom = 13
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @area = City.find(params[:id])
  end
end
