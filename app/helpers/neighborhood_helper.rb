module NeighborhoodHelper

  def users_neighborhood(neighborhood)
    if current_user
      if current_user.neighborhoods.include?(neighborhood)
        link_to 'Forget Neighborhood', neighborhood_forget_path(neighborhood), class: 'btn search list-group-item sidebar-button', "data-no-turbolink" => true
      else
        link_to 'Star Neighborhood', neighborhood_save_path(neighborhood), class:'btn list-group-item sidebar-button', "data-no-turbolink" => true
      end
    end
  end

  def users_image_upload
    if current_user
      link_to 'Upload Picture', '#', class: 'btn search list-group-item sidebar-button'
    end
  end

end
