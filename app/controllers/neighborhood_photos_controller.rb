class NeighborhoodPhotosController < ApplicationController
  def create
    @photo = current_user.neighborhood_photos.create(photo_params)

    if @photo.save
      redirect_to neighborhood_path(@photo.neighborhood_id)
    else
      redirect_to root_path
    end
  end

  private

  def photo_params
    params.require(:neighborhood_photo).permit(:photo, :neighborhood_id, :user_id)
  end
end
