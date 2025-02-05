class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:destroy]
  
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    
    if current_user.nil? 
      flash[:alert] = "ログインしてください。" 
      redirect_to new_user_session_path 
      return 
    end

    @comment.user = current_user

    if @comment.save
      redirect_to album_path(@album)
    else
      render 'photos/show'
    end
  end

  def destroy
    if @comment.user == current_user 
      @comment.destroy
      redirect_to album_path(@comment.photo.album)
    else
      flash[:alert] = 'コメントの削除権限がありません。'
      redirect_to album_path(@comment.photo.album)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end