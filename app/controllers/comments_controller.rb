class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    redirect_to posts_path if @comment.save
  end

  def update
    redirect_to posts_path if @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
    end
end
