require 'rails_helper'

RSpec.describe User, :type => :model do

 it 'has a valid phone number' do
   u = User.create(display_name: 'allie', phone_number: '+12345678923')
   expect(u.phone_number).to eq('+12345678923')
 end

 it 'saves phone number as valid' do
   u = User.create(display_name: 'allie', phone_number: '(234)567-8923')
   expect(u.phone_number).to eq('+12345678923')
 end

end
