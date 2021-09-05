class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @comment = Comment.new
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    redirect_to root_path if @post.save
  end

  def update
    redirect_to @post if @post.update(post_params)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
