class Api::V1::EstablishmentsController < ApplicationController
  respond_to :json

  def index
    @area = Neighborhood.friendly.find(params[:neighborhood_id])
    filter = params[:filter]
    foursquare = Foursquare.new(@area, filter)
    @establishments = foursquare.establish_establishments
    respond_with @establishments
  end

end
