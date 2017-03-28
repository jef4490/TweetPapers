class TweetController < ApplicationController
  def show
      twitterApi = TwitterApi.new
      tweet_id = params[:id]
      tweet_object = twitterApi.gather_tweet_data(tweet_id)
      render json: tweet_object.to_json
  end

  def user_timeline
    twitterApi = TwitterApi.new
    timeline_object = twitterApi.user_timeline(params)
    render json: timeline_object.to_json
  end

end
