require_relative '../models/foursquare'

class NeighborhoodsController < ApplicationController
  require 'json'

  def show
    @area = Neighborhood.friendly.find(params[:id])
    @filters = ['Food', 'Drinks', 'Coffee', 'All']
    @photo = current_user.neighborhood_photos.new if current_user
  end

  def save
    @area = Neighborhood.friendly.find(params[:neighborhood_id])
    current_user.save_neighborhood(@area)
    redirect_to neighborhood_path(@area)
  end

  def forget
    @area = Neighborhood.friendly.find(params[:neighborhood_id])
    current_user.forget(@area)
    redirect_to neighborhood_path(@area)
  end

  def photos
    @area = Neighborhood.friendly.find(params[:neighborhood_id])
    @photos = @area.neighborhood_photos
  end
end
