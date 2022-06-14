class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = params[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
