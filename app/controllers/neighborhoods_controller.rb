require_relative '../models/foursquare'

class NeighborhoodsController < ApplicationController
  require 'json'

  def index
  end

  def show
    @area = Neighborhood.friendly.find(params[:id])
    @filters = ['Food', 'Drinks', 'Coffee', 'All']
  end

  def save
    @area = Neighborhood.friendly.find(params[:id])
    current_user.neighborhoods << @area
    redirect_to neighborhood_path(@area)
  end

  def forget
    @area = Neighborhood.friendly.find(params[:id])
    current_user.neighborhoods.destroy(@area)
    redirect_to neighborhood_path(@area)
  end
end

#
