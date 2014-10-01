require 'rails_helper'

describe 'a user visting the site', type: :feature do

  it 'can land on a homepage' do
    visit root_path
    expect(page).to have_content("Where's the party?")
  end

  it 'can enter in a city' do
    visit root_path
    fill_in('search', with: 'Denver')
    click_on('Go!')
    expect(page).to have_content('You searched for Denver')
  end

  xit 'can search for a specific location' do 
  end

end
