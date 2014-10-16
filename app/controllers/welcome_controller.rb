class WelcomeController < ApplicationController
	def search
		begin
	    result = PgSearch.multisearch(params[:search]).first
	      if result.searchable_type == "Neighborhood"
					neighborhood_redirect(result)
	      elsif result.searchable_type == "City"
					city_redirect(result)
	      end
		rescue
			redirect_to root_path
		end
  end

	private

	def city_redirect(result)
		c = City.find(result.searchable_id)
		redirect_to city_path(c)
	end

	def neighborhood_redirect(result)
		n = Neighborhood.find(result.searchable_id)
		redirect_to neighborhood_path(n)
	end
end
