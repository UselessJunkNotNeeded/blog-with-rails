class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new()
    @like.author_id = params[:user_id]
    @like.post_id = params[:post_id]
    if @like.save
      flash[:notice] = "Post liked"
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      redirect_to user_post_path(params[:user_id], params[:post_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
