class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id:current_user.friends).or(Post.where(user_id:current_user)).order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash.notice = "Post successfully created!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "You can't Post a blank Post"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body, :photo)
  end
end