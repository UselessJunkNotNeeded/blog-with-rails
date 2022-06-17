class Api::CommentsController < ApplicationController
  include Response
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    if @comments.empty?
      json_response({res: 'No comments'})
    else
      render json: @comments, status: :ok
    end
  end

  def create
    @comment = Comment.create(params.require(:comment).permit(:text))
    @comment.post_id = params[:post_id]
    @comment.author_id = params[:user_id]
    if @comment.save
      render json: @comment, status: 200
    else
      json_response({res: 'Failed to create comment'}, status: 400)
    end
  end
end
