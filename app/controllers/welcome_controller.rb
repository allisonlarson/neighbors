class WelcomeController < ApplicationController
  def index

  end

	def search
    result = PgSearch.multisearch(params[:search]).first
    begin
      if result.searchable_type == "Neighborhood"
        n = Neighborhood.find(result.searchable_id)
        redirect_to neighborhood_path(n)
      elsif result.searchable_type == "City"
        c = City.find(result.searchable_id)
        redirect_to city_path(c)
      end
    rescue
      render :index
    end
  end
end
