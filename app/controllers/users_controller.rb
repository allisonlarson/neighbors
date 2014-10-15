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
      TextWorker.text(current_user)
    end
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :city, :phone_number, :send_texts)
  end
end
