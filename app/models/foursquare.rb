class Foursquare

  BASE_URL = 'https://api.foursquare.com/v2/'

  def initialize(neighborhood, filter)
    @neighborhood = neighborhood
    @filter = filter
  end

  def venue_search_url
    BASE_URL + 'venues/explore?' + {
      client_id: '4YV00VWDCJRCFRN4YMYLYNPHTMIR2YHAYW22KATQGACL5AEF',
      client_secret: 'I4QOZRRED0QQ0TNPEYQ3I2AUSNEL2AE4GJDYF10RORCTURVE',
      limit: 50,
      ll: lat_lon,
      v: '20130118',
      m: 'swarm',
      openNow: true,
      section: @filter
    }.to_query
  end

  def establish_establishments
    venue = JSON.load(get_establishments.body)
    venue.map {|v| venue['response']['groups'].first['items'].map do |i| i['venue']end}.flatten
  end

  private

  def lat_lon
    coord = @neighborhood.coordinates.sample
    "#{coord.lat},#{coord.lon}"
  end

  def connect
    Faraday.new(:url => BASE_URL) do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_establishments
    connect.get venue_search_url
  end

end
