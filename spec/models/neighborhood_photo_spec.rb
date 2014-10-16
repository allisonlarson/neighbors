require 'rails_helper'

RSpec.describe NeighborhoodPhoto, :type => :model do

  it { should belong_to(:user)}
  it { should belong_to(:neighborhood)}
end
