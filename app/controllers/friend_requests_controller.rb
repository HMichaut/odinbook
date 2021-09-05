class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.where(receiver_id: current_user.id)
  end

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

  def destroy
    FriendRequest.find(params[:id]).destroy
  end

  private
    def friend_request_params
      params.permit(:sender_id, :receiver_id, :authenticity_token, :commit)
    end
end
