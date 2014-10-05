class CitiesController < ApplicationController
  def show
    @area = City.friendly.find(params[:id])
    @filters = @area.neighborhoods.sort_by {|n| n.name}
    @neighborhoods = @filters.map {|n| n.coordinates}
  end
end
