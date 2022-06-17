class Api::PostsController < ApplicationController
  before_action :authorize_request
  skip_before_action :authenticate_user!
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