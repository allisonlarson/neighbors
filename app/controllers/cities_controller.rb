class CitiesController < ApplicationController
  def show
    @area = City.find(params[:id])
    @filters = @area.neighborhoods
  end
end
