class PostsController < ApplicationController
  def show; end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

end
