require_relative '../models/foursquare'

class NeighborhoodsController < ApplicationController
  require 'json'

  def index
  end

  def show
    @area = Neighborhood.friendly.find(params[:id])
    @filters = ['Food', 'Drinks', 'Coffee', 'All']
  end
end

#
