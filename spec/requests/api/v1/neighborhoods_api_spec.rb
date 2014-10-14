require 'rails_helper'

describe 'Neighborhoods API', :type => :request do
  # include Rack::Test::Methods
    it 'retrieves all of the neighborhoods' do
      FactoryGirl.create_list(:neighborhood, 10)
      get '/api/v1/neighborhoods.json'

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(10)
    end

    it 'gets one neighborhood' do
      n = FactoryGirl.create(:neighborhood)
      get "/api/v1/neighborhoods/#{n.id}.json"

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['name']).to eq('Baker')
    end

end
