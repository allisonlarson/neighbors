class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def text
    if current_user.phone_number?
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: current_user.phone_number,
        body: "TEXT MESSAGE"
      )
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :city, :phone_number, :send_texts)
  end
end
