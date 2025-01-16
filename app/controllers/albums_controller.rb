class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :set_album, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  def index
    @albums = Album.includes(:user)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to "/users/#{current_user.id}"
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end
  end

  def show
    @photos = @album.photos
    @nickname = current_user.nickname
  end

  private

  def album_params
    params.require(:album).permit(:title, :image).merge(user_id: current_user.id)
  end

  def set_album
    @album = Album.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def authorize_user!
    unless @album.user == current_user
      redirect_to new_user_session_path
    end
  end

end
