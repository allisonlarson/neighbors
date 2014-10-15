require 'rails_helper'

describe 'Neighborhoods API', :type => :request do

    it 'retrieves all of the neighborhoods' do
      FactoryGirl.create_list(:neighborhood, 10)
      get '/api/v1/neighborhoods.json'

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['neighborhoods'].length).to eq(10)
    end

    it 'gets one neighborhood if admin' do
      n = FactoryGirl.create(:neighborhood)
      get "/api/v1/neighborhoods/#{n.id}.json?admin=true"

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['neighborhood']['name']).to eq('Baker')
    end

    it 'does not get neighborhood if not admin' do
      n = FactoryGirl.create(:neighborhood)
      get "/api/v1/neighborhoods/#{n.id}.json"

      expect(response).to_not be_success

    end

end
