class CommentsController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
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