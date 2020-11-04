class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @friend_requests = current_user.received_friend_requests
  end
end
