class Api::PostsController < ApplicationController
  include Response
  def index
    @posts = Post.where(author_id: params[:user_id])

    if @posts.empty?
      json_response({ res: 'No posts found' })
    else
      render json: @posts
    end
  end
end