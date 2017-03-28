class TweetController < ApplicationController
  def show
      twitterApi = TwitterApi.new
      tweet_number = params[:id]
      tweet_object = twitterApi.gather_tweet_data(tweet_number)
      render json: tweet_object.to_json
  end
end
