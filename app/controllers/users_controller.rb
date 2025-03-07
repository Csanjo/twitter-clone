class UsersController < ApplicationController

  def show
    @tweets = User.find(params[:id]).tweets.order("created_at DESC")
    @user = User.find(params[:id])
  end

  def follow
    @follow_user = User.find(params[:id])
    current_user.follow(@follow_user)
    redirect_to user_path(@follow_user)
  end
  def unfollow
    @unfollow_user = User.find(params[:id])
    current_user.unfollow(@unfollow_user)
    redirect_to user_path(@unfollow_user)
  end
end
