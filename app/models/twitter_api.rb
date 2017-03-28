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


 def most_recent_friend
   # self.client.friends.attrs[:users][0]
   @client.friends.first
   #find the twitter gem method that retrieves a user's friends and grab the most recent friend
 end

end
