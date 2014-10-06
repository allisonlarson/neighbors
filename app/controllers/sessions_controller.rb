class SessionsController < ApplicationController
  def create
   auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user
    session[:user_id] = @auth.user.id
    redirect_to request.env['omniauth.origin'] || '/default'
  end

  def destroy
    session[:user_id] = nil
    self.current_user = nil
    redirect_to root_path
  end
end
