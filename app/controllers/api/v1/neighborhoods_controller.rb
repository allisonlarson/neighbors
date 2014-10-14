class Api::V1::NeighborhoodsController < ApplicationController
  respond_to :json, :xml
  before_filter :admin?, only: :show

  def index
    @neighborhoods = Neighborhood.all
    respond_with @neighborhoods
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    respond_with @neighborhood
  end

  private

  def admin?
    render :status unless params['admin'] == true
  end

end
