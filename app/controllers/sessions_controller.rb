class SessionsController < ApplicationController
  def create
   auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user
    session[:user_id] = current_user.id
    redirect_to relevant_location
  end

  def destroy
    session[:user_id] = nil
    self.current_user = nil
    redirect_to root_path
  end

  def relevant_location
    begin
      city = City.find_by(name: current_user.city)
      city_path(city)
    rescue
      request.env['omniauth.origin'] || '/default'
    end
  end
end
