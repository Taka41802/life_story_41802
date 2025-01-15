class PhotosController < ApplicationController
  before_action :set_album, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_photo, only: [:edit, :update, :destroy]

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

      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params.except(:image))
      images = Array.wrap(photo_params[:image]).reject(&:blank?)
      @photo.image.purge_later if photo_params[:image].present?
      images.each do |image|
        @photo.image.attach(image)
      end

      redirect_to album_path(@album)
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to album_path(@album)
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_photo
    @photo = @album.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:description, :images)
  end
end