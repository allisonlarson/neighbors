class WelcomeController < ApplicationController
  def index

  end

	def search
    result = PgSearch.multisearch(params[:search]).first
    if result.searchable_type == "Neighborhood"
      redirect_to neighborhood_path(result.searchable_id)
    elsif result.searchable_type == "City"
      redirect_to city_path(result.searchable_id)
    else
      render :status
    end
  end
end
