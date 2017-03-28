class RootController < ApplicationController

  def index
  end

  def get_tweet
    twitterApi = TwitterApi.new
    tweet_number = params[]
    tweet_object = twitterApi.gather_tweet_data(tweet_number)
    render json: tweet_object.to_json
  end

end
