class PostsController < ApplicationController
  def show; end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

end
