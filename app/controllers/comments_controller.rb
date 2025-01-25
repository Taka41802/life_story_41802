class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      # コメント保存成功時の処理
      redirect_to photo_path(@photo), notice: 'コメントを投稿しました。'
    else
      # コメント保存失敗時の処理
      render 'photos/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end