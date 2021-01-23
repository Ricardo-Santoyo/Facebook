class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to posts_path, :notice => 'Post Liked!'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to posts_path, :notice => 'You have Unliked this Post'
    end
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
