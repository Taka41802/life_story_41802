class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :show]
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    Album.create(album_params)
    redirect_to '/'
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to root_path
  end

  def show
  end

  private

  def album_params
    params.require(:album).permit(:title)
  end

  def set_album
    @album = Album.find(params[:id])
  end

end
