class ApiController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: { 'logged_in' => true }
  end

  def user_posts
    @posts = current_user.posts

    render json: { posts: @posts }
  end

  def user_comments
    @comments = current_user.posts.find(params[:post_id]).comments

    render json: { comments: @comments }
  end

  def create_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.create(post: @post, author: current_user, text: params[:text])

    render json: { status: 'Comment created successfully' }
  end
end
