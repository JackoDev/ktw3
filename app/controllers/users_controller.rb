class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
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
