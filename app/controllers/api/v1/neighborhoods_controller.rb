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
    if !params['admin']
      render file: 'public/404.html', status: :unauthorized
    end
  end

end
