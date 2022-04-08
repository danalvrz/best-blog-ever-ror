class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      flash[:notice] = 'Something went wrong!'
      render 'posts/index'
    end
  end
end
