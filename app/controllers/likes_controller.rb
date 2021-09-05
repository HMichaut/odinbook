class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: like_params[:post_id], user_id: like_params[:user_id])
    redirect_to posts_path if @like.save
  end

  private
    def like_params
      params.permit(:post_id, :user_id, :authenticity_token, :commit)
    end
end
