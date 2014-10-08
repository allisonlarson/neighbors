require_relative '../models/foursquare'

class NeighborhoodsController < ApplicationController
  require 'json'

  def index
  end

  def show
    @area = Neighborhood.friendly.find(params[:id])
    @filters = ['Restaurant', 'Bars', 'Ice Cream', 'Parks']
    foursquare = Foursquare.new(@area)
    @establishments = foursquare.establish_establishments
  end

end
