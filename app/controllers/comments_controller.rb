class CommentsController < ApplicationController
  before_action :authenticate_user!
  
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
      redirect_to album_path(@album), notice: 'コメントを投稿しました。'
    else
      render 'photos/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end