class VerificationsController < ApplicationController
  before_filter :get_user
  skip_before_filter :verify_authenticity_token,

  def create
    photo = params['MediaUrl0']
    upload_photo(photo, params)
    head :ok
  end

  def upload_photo(photo, params)
    neighborhood = Neighborhood.find_by(name: params['Body'])
    NeighborhoodPhoto.create(photo: photo, neighborhood_id: neighborhood.id, user_id: @user.id )
    ReplyWorker.reply(@user, neighborhood.name)
  end

  private

  def get_user
    unless @user = User.find_by(phone_number: params['From'])
      head :not_found
    end
  end

end
