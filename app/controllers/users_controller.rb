class UsersController < ApplicationController
  def index
    @users = User.where.not(id:current_user).order(created_at: :asc)
    @sent_friend_requests = current_user.sent_friend_requests.map(&:receiver)
    @received_friend_requests = current_user.received_friend_requests.map(&:sender)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.photo.attached?
      @user.photo.purge
    end

    @user.photo.attach(params[:user][:photo])
    if @user.photo.blob.byte_size > 5000000
      @user.photo.purge
      redirect_to user_path(current_user), :alert => 'Too Big. Max Image Size is 5MB.'
    else
      redirect_to user_path(current_user), :notice => 'Profile Picture Updated!'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      redirect_to new_user_session_path ,:notice => 'Your Account Has Been Deleted'
    end
  end
end