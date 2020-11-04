class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path, :notice => 'Comment Posted!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to root_path, :notice => 'Your comment has been deleted'
    end
  end

  private

  def comment_params
    params.permit(:body, :user_id, :post_id)
  end
end
