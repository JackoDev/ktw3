class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy following followers ]
  before_action :authenticate_user!

  # @users = User.paginate(page: params[:page])
  # User.paginate(page: params[:page], per_page: 10)

  def index
    @users = User.all
    # User.paginate(page: params[:page], per_page: 10)

  end

  def show

  end

  def new
  end

  def edit
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followees.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :username)
    end
end
