class TwitterApi
 attr_reader :client

 def initialize
  #  keys = YAML.load_file('application.yml')
   @client = Twitter::REST::Client.new do |config|
     config.consumer_key        = ENV['CONSUMER_KEY']
     config.consumer_secret     = ENV['CONSUMER_SECRET']
     config.access_token        = ENV['ACCESS_TOKEN']
     config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
   end
 end

 def gather_tweet_data(tweet_number)
   @client.status(tweet_number)
 end

def user_timeline(params)
  tweet_id = params[:id]
  user_id = params[:user_id]
  count = params[:count]
  byebug
  @client.user_timeline(user_id, {max_id: tweet_id, count: count})
end
 # t.client.user_timeline(2437619918, count: 50)
 # t.client.user_timeline(2030711, {max_id: 846350257436983296})
 # t.client.user_timeline(2030711, {max_id: 846350257436983296, count: 5}).first.text #=> "11. But the overall point is that the political economy debate is actually occurring among all groups, it just has different aesthetics."
 # t.client.user_timeline(2030711, {max_id: 846351172680241154, count: 12}).last.text #=> "1. Trump"

end
