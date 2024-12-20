class UserController < ApplicationController

  def show
    @tweets = User.find(params[:id]).tweets.order("created_at DESC")
    @user = User.find(params[:id])
  end
end
