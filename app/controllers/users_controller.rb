class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def show
    @posts = @user.three_most_recent_posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
