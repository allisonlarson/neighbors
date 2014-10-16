module WelcomeHelper

  def current_city
    if current_user && current_user.favorite_neighborhoods.length > 0
      id = current_user.favorite_neighborhoods.first.neighborhood_id
      n = Neighborhood.find(id)
      n.name
    else
      'denver'
    end
  end
end
