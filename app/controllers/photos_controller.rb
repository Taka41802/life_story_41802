class PhotosController < ApplicationController
  before_action :set_album, only: [:new, :create]

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to album_path(@album), notice: 'Photo was successfully created.'
    else
      flash.now[:alert] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:description, :image, :posted_date)
  end
end