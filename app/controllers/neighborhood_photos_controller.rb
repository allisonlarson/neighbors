class NeighborhoodPhotosController < ApplicationController
  def create
    @photo = current_user.neighborhood_photos.create(photo_params)
    binding.pry
    if @photo.save
      redirect_to neighborhood_path(@photo.neighborhood_id)
    else
      redirect_to root_path
    end
  end

  private

  def photo_params
    params.require(:neighborhood_photo).permit(:neighborhood_photo, :neighborhood_id, :user_id)
  end
end
