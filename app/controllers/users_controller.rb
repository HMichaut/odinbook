class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit ]

  def index
    @users = User.where.not(id: current_user.id)
    @friend_request_array = current_user.sent_friend_requests.map{ |u| u.receiver_id }
    @friend_array = current_user.friends.map{ |u| u.user_id }
  end

  def show
    @posts = Post.where(user_id: [:id]).order("created_at DESC")
  end

  def edit
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
