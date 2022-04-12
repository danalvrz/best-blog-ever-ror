class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.includes(:post).where(post: { id: params[:post_id] })
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(params.require(:post).permit(:authenticity_token, :title, :text, :user_id))
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      flash[:notice] = 'Something went wrong!'
      render 'posts/index'
    end
  end
end
