class Api::V1::NeighborhoodsController < ApplicationController
  respond_to :json, :xml

  def index
    @neighborhoods = Neighborhood.all
    respond_with @neighborhoods
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    respond_with @neighborhood
  end

end
