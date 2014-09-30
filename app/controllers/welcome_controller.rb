class WelcomeController < ApplicationController
  def index

  end

	def search
  	if params[:search] && params[:search] != ""
  		 if params[:search] == "Denver"
         render :city
       else
         render :neighborhood
       end
  	end
  end
end
