require 'rails_helper'

describe 'a user visting the site', type: :feature do

  before do
    c = City.create!(name:"Denver", description: nil)
    c.coordinates.create(lat:39.7392, lon:-104.9847, locatable_id: c.id , locatable_type:'City')
    n = c.neighborhoods.create(name:"Capitol Hill", description: nil, city_id:c.id)
    n.coordinates.create(lat:39.74696439907081, lon:-104.9775441563172, locatable_id: n.id, locatable_type: 'Neighborhood')
  end

  it 'can land on a homepage' do
    visit root_path
    expect(page).to have_content("Where's the party?")
  end

  it 'can enter in a city' do
    visit root_path
    fill_in('search', with: 'Denver')
    click_on('Go!')
    expect(page).to have_content('Denver')
  end

  it 'can enter in a neighborhood' do
    visit root_path
    fill_in('search', with: 'Capitol Hill')
    click_on('Go!')
    expect(page).to have_content('Capitol Hill')
  end


end
