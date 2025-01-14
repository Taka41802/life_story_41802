class PhotosController < ApplicationController
  before_action :set_album, only: [:new, :create]

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params.except(:image))
    @photo.user = current_user

    if @photo.save
      images = Array.wrap(photo_params[:image]).reject(&:blank?)
      images.each do |image|
        @photo.image.attach(image)
      end

      redirect_to album_path(@album), notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:description, :images)
  end
end