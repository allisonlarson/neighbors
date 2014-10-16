class CitiesController < ApplicationController
  def show
    @area = City.friendly.find(params[:id])
    @neighborhoods = @area.neighborhoods.sort_by {|n| n.name}
  end
end
