class PhotosController < ApplicationController

  def index
    @photos = Photo.includes(:user)
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :user_id, :image)
  end
end