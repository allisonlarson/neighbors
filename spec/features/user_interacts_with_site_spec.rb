require 'rails_helper'

describe 'a user visting the site', type: :feature do

  before do
    City.create!(name:"Denver", description: nil)
    Coordinate.create!(lat:39.7392, lon:-104.9847, locatable_id:1, locatable_type:'City')
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

  xit 'can search for a specific location' do
  end

end
