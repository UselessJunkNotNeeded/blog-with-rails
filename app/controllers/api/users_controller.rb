class Api::UsersController < ApplicationController
  before_action :authorize_request
  skip_before_action :authenticate_user!
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
