class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Followship.find(params[:id]).followee
    current_user.unfollow(user)
    redirect_to user
  end

end
