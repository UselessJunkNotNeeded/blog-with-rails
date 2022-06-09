class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.author_id = params[:user_id]
    @like.post_id = params[:post_id]
    flash[:notice] = 'Post liked' if @like.save
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:like).permit(:text)
  end
end
