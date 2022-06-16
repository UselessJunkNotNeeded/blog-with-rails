class PostsController < ApplicationController
  # load_and_authorize_resource only: %i[edit update destroy create]
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.author_id = params[:user_id]
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_path(params[:user_id])
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    return unless @post.destroy

    flash[:success] = 'Post deleted successfully'
    redirect_to user_posts_path
  end

  def user_params
    params.require(:post).permit(:title, :text)
  end
end
