class LikesController < ApplicationController
    def create
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @like = Like.new(author: current_user, post: @post)
 
      if @like.save
        @like.likes_counter
        redirect_to user_post_path(@user, @post)
      else
        flash[:notice] = "Error!"
      end
    end
  end