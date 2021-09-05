class FriendRelationshipsController < ApplicationController

  def index
    @friend_relationships = FriendRelationship.where(user_id: current_user.id)
  end

  def new
    @friend_relationship = FriendRelationship.new
  end

  def create
    @friend_relationship_1 = FriendRelationship.new(user_id: friend_relationship_params[:user_id], friend_id: friend_relationship_params[:friend_id])
    @friend_relationship_2 = FriendRelationship.new(friend_id: friend_relationship_params[:user_id], user_id: friend_relationship_params[:friend_id])
    if @friend_relationship_1.save && @friend_relationship_2.save
      FriendRequest.find(friend_relationship_params[:friend_request_id]).destroy
      redirect_to friend_requests_path
    else
      render :new
    end
  end

  private
    def friend_relationship_params
      params.permit(:user_id, :friend_id, :friend_request_id, :authenticity_token, :commit)
    end
end
