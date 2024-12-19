class PagesController < ApplicationController

  def home
    @tweet = Tweet.new
    @user = current_user
    if current_user.nil?
      @tweets = Tweet.all.order("created_at DESC")
    else
      @tweets = []
      current_user.followers.each do |follower|
        follower.tweets.each do |tweet|
          @tweets << tweet
        end
      end
      @user.tweets.each do |tweet|
        @tweets << tweet
      end
      @tweets = @tweets.sort_by { |tweet| tweet.created_at}.reverse
    end
  end

end
