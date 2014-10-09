module NeighborhoodHelper

  def users_neighborhood(neighborhood)
    if current_user.neighborhoods.include?(neighborhood)
      link_to 'Forget Neighborhood', forget_neighborhood_path, class: 'btn search list-group-item sidebar-button', "data-no-turbolink" => true
    else
      link_to 'Star Neighborhood', save_neighborhood_path, class:'btn list-group-item sidebar-button', "data-no-turbolink" => true
    end
  end

end
