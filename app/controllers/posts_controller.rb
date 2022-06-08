class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.author_id = params[:user_id]
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def user_params
    params.require(:post).permit(:title, :text)
  end
end
