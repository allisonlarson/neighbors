class NeighborhoodsController < ApplicationController
  require 'json'
  def index
  end

  def show
    @area = Neighborhood.friendly.find(params[:id])
    @filters = ['Restaurant', 'Bars', 'Ice Cream', 'Parks']
    @establishments = establish_establishments
  end

  def connect
    Faraday.new(:url => 'https://api.foursquare.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_establishments
    lat = @area.coordinates.first.lat
    lon = @area.coordinates.first.lon
    connect.get "/v2/venues/explore?client_id=4YV00VWDCJRCFRN4YMYLYNPHTMIR2YHAYW22KATQGACL5AEF&client_secret=I4QOZRRED0QQ0TNPEYQ3I2AUSNEL2AE4GJDYF10RORCTURVE&ll=#{lat},#{lon}&v=20130815&m=swarm"
  end

  def establish_establishments
    venue = JSON.load(get_establishments.body)
    venue.map {|v| venue['response']['groups'].first['items'].map do |i| i['venue']end}.flatten
  end
end
