class AddAttachmentPhotoToNeighborhoodPhotos < ActiveRecord::Migration
  def self.up
    change_table :neighborhood_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :neighborhood_photos, :photo
  end
end
