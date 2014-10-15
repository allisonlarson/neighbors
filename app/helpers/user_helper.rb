module UserHelper

  def format_phone
    phone = number_to_phone(current_user.phone_number, area_code: true)
  end

  def groups
    current_user.neighborhood_photos.group_by(&:neighborhood_id)
  end

end
