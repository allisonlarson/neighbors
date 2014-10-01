class WelcomeController < ApplicationController
  def index

  end

	def search
  	if params[:search] && params[:search] != ""
      redirect_to neighborhood_path(params[:search])
  	end
  end
end
