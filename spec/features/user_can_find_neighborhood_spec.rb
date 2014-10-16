require 'rails_helper'

describe 'a user searching the site for a neighborhood', type: :feature do

  before do
    c = City.create!(name:"Denver", description: nil)
    c.coordinates.create(lat:39.7392, lon:-104.9847, locatable_id: c.id , locatable_type:'City')
    @n = c.neighborhoods.create(name:"Capitol Hill", description: nil, city_id:c.id)
    @n.coordinates.create(lat:39.74696439907081, lon:-104.9775441563172, locatable_id: @n.id, locatable_type: 'Neighborhood')
  end

  it 'can find a neighborhood through city' do
    visit root_path
    fill_in('search', with: 'Denver')
    click_on('Go!')
    click_on('Capitol Hill')
    expect(page).to have_content('Capitol Hill')
  end

  it 'can find a neighborhood' do
    visit root_path
    fill_in('search', with: 'Capitol Hill')
    click_on('Go!')
    expect(page).to have_content('Capitol Hill')
  end

  it 'can view neighborhoods photos' do
    visit root_path
    fill_in('search', with: 'Capitol Hill')
    click_on('Go!')
    click_on('See Photos')
    expect(current_path).to eq(neighborhood_photos_gallery_path(@n))
  end



end
