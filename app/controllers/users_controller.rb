class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def index
    @users = User.where.not(id: current_user.id)
    @friend_request_array = current_user.sent_friend_requests.map{ |u| u.receiver_id }
    @friend_array = current_user.friends.map{ |u| u.friend_id }
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
