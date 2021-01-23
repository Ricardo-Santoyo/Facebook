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
      if @post.photo.attached?
        if @post.photo.blob.byte_size > 5000000
          @post.destroy
          flash.now[:alert] = 'Too Big. Max Image Size is 5MB.'
          render 'new'
        else
          flash.notice = "Post successfully created!"
          redirect_to post_path(@post)
        end
      else
        flash.notice = "Post successfully created!"
        redirect_to post_path(@post)
      end
    else
      flash.now[:alert] = "You can't Post a blank Post"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, :notice => 'Your Post has been Deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :photo)
  end
end