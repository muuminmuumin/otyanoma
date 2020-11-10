class CommentsController < ApplicationController
  def create
    @content = Content.find(params[:content_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to content_path(@content), notice: "コメントを入力しました"
    else
      flash.now[:alert] = "失敗しました。再度お試しください"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, content_id: params[:content_id])
  end

end
