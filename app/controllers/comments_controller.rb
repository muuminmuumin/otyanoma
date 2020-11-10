class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to content_path(params[:id]), notice: "コメントを投稿しました"
    else
      redirect_to content_path(params[:id])
      flash.now[:alert] = "失敗しました。再度お試しください"
      
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end
