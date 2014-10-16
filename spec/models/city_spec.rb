require 'rails_helper'

RSpec.describe City, type: :model do

  it { should have_many(:neighborhoods) }
  it { should have_many(:coordinates) }
  
end
