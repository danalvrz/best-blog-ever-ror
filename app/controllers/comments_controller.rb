class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:notice] = 'Comment was not created.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
