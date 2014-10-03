require 'rails_helper'

describe 'a user searching the site for a neighborhood', type: :feature do

  before do
    Neighborhood.create!(name:"Capitol Hill", description: nil, city_id:1)
    Coordinate.create!(lat:39.74696439907081, lon:-104.9775441563172, locatable_id: 1, locatable_type: 'Neighborhood')
  end

  it 'can find a neighborhood' do
    visit root_path
    fill_in('search', with: 'Capitol Hill')
    click_on('Go!')
    expect(page).to have_content('Capitol Hill')
  end

end
