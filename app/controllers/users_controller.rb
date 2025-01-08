class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @albums = current_user.albums
  end
end
