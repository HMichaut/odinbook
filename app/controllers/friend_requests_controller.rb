class FriendRequestsController < ApplicationController
  def new
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = FriendRequest.new(sender_id: friend_request_params[:sender_id], receiver_id: friend_request_params[:receiver_id])
    if @friend_request.save
      redirect_to users_path
    else
      render :new
    end
  end

  private
    def friend_request_params
      params.permit(:sender_id, :receiver_id, :authenticity_token, :commit)
    end
end
