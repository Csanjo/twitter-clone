class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    if !current_user.liked?(params[:id])
      @like = @tweet.favorites.create(user_id: current_user.id)
    else
      @unlike = @tweet.favorites.find_by(user_id:  current_user.id).destroy
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
