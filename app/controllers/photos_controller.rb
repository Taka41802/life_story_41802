class PhotosController < ApplicationController
  before_action :set_album, only: [:new, :create]

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params)
    if @photo.save
      redirect_to album_photo_path(@album, @photo), notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :user_id, :image, :posted_date)
  end
end