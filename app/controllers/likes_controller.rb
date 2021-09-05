class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: like_params[:post_id], user_id: like_params[:user_id])
    if @like.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
    def like_params
      params.permit(:post_id, :user_id, :authenticity_token, :commit)
    end
end
