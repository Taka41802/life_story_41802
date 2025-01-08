class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @albums = current_user.albums
  end
end
