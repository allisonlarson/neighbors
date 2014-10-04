class CitiesController < ApplicationController
  def show
    @filters = ['Restaurants', 'Bars', 'Ice Cream', 'Coffee', 'Parks']
    @area = City.find(params[:id])
  end
end
