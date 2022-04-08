class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'You liked it!'
    else
      flash[:notice] = 'Error!'
    end
  end
end
