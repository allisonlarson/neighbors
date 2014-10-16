require 'rails_helper'

RSpec.describe Neighborhood, :type => :model do

  it { should belong_to(:city)}
  it { should have_many(:coordinates)}
  it { should have_many(:favorite_neighborhoods)}
  it { should have_many(:users)}
  it { should have_many(:neighborhood_photos)}
end
