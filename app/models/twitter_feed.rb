class TwitterFeed < Feed
  require 'twitter'
  attr_accessor :client, :type

  def self.search(twitter_search)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
    #@client.user_timeline(twitter_search)
    @client.user_search(twitter_search)
  end
end
