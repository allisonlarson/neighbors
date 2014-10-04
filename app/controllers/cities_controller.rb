class CitiesController < ApplicationController
  def show
    @area = City.friendly.find(params[:id])
    @filters = @area.neighborhoods
    @neighborhoods = @filters.map {|n| n.coordinates}
  end
end
