require 'rails_helper'

RSpec.describe FavoriteNeighborhood, :type => :model do

  it {should belong_to(:user)}
  it {should belong_to(:neighborhood)}
end
