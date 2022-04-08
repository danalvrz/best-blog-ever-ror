class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post_id = @post.id
    @like.author_id = current_user.id

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'You liked it!'
    else
      flash[:notice] = 'Error!'
    end
  end
end
