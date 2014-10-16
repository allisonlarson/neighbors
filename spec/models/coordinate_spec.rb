require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  it { should belong_to(:locatable)}
end
