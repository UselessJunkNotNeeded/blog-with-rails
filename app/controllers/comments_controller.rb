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
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless @comment.destroy

    flash[:success] = 'Comment deleted successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
