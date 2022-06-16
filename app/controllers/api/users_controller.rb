class Api::UsersController < ApplicationController
  include Response
  def index
    @users = User.all
    if @users.empty?
      json_response({res: 'No users'})
    else
      render json: @users
    end
  end

  def show
    render json: User.find(params[:id])
  end
end
