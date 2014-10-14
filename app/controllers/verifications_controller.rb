class VerificationsController < ApplicationController
  before_filter :get_user
  skip_before_filter :verify_authenticity_token,

  def create
    photo = params['MediaUrl0']
    upload_photo(photo, params)
    head :ok
  end

  private

  def upload_photo(photo, params)
    binding.pry
    neighborhood = Neighborhood.find_by(name: params['Body'])
    NeighborhoodPhoto.create(photo: photo, neighborhood_id: neighborhood.id, user_id: @user.id )
  end

  def send_status
    last_order = @user.orders.last
    this = last_order.sub_orders.map do |order|
      "Your order from #{order.supplier.name} is #{order.status}"
    end
    return this.flatten
  end

  def text(text_body)
    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: @user.phone_number,
      body: text_body
    )
  end

  def get_user
    unless @user = User.find_by(phone_number: params['From'])
      head :not_found
    end
  end

end
