require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
  end

  it 'is valid with a email address' do
    user = User.create(email: 'hi@example.com', display_name: 'bob')

    expect(user).to be_valid
  end

  it 'is valid with a display name' do
    user = User.create(email: 'hi@example.com', display_name: 'bob')

    expect(user).to be_valid
  end

  it 'is invalid without an email address' do
    user = User.create(email: nil, display_name: 'bob')

    expect(user).to_not be_valid
  end

  it 'is invalid without a display name' do
    user = User.create(email: 'hi@example.com', display_name: nil)

    expect(user).to_not be_valid
  end

end
