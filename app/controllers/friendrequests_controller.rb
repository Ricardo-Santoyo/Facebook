class FriendrequestsController < ApplicationController
  def create
    @friendrequest = Friendrequest.new(friendrequest_params)
    if @friendrequest.save
      redirect_to users_path, :notice => 'Friend Request Sent!'
    end
  end

  def destroy
    @friendrequest = Friendrequest.find(params[:id])
    if params[:type] == "accept"
      flash.notice = "You are now friends with #{@friendrequest.sender.name}!"
      @friendrequest.accept
      redirect_to notifications_path
    elsif params[:type] == "decline"
      @friendrequest.decline
      flash.notice = "Declined friend request"
      redirect_to notifications_path
    end
  end

  private

  def friendrequest_params
    params.permit(:sender_id, :receiver_id)
  end
end
