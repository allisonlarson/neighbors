require 'rails_helper'

describe 'Establishments API', :type => :request do

  xit 'gets a neighborhoods establishments' do
    n = FactoryGirl.create(:neighborhood)
    e = FactoryGirl.create(:establishment)

    get "/api/v1/neighborhoods/#{n.id}/establishments.json"
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(1)
  end
end
