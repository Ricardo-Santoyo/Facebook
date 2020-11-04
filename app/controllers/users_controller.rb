class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id:current_user)
    @sent_friend_requests = current_user.sent_friend_requests.map(&:receiver)
    @received_friend_requests = current_user.received_friend_requests.map(&:sender)
  end

  def show
    @user = User.find(params[:id])
  end
end