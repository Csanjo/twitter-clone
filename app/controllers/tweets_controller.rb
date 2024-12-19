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


  private

  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
