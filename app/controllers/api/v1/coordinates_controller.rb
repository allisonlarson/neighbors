class Api::V1::CoordinatesController < ApplicationController
  respond_to :json

  def index
    neighborhood = Neighborhood.friendly.find(params[:neighborhood_id])
    @coordinates = Coordinate.where(locatable_id: neighborhood.id).all
    respond_with @coordinates
  end

end
