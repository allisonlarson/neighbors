class NeighborhoodPhoto < ActiveRecord::Base
  mount_uploader :neighborhood_photo, NeighborhoodPhotoUploader
  
  belongs_to :user
  belongs_to :neighborhood
end
