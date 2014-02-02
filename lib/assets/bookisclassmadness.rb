class FeedRequest
  attr_accessor :results, :successful?, :provider

  def self.search_bar(search_params = nil, search_type, token, secret, username)
    # if TwitterFeed.set_home_tweets(token,secret,username)
    #   TwitterFeed.set_home_tweets(token,secret,username)
    # end
    case search_type
    when "all"
      #Searches All
      { feed: Feeder.search(search_params), tumblr: Tumblr.search(search_params), twitter: TwitterFeed.search(search_params) }
    when "feed"
      #Searches by Feed
      { feed: Feeder.search(search_params) }
    when "tumblr"
      #Searches by Tumblr
      feed = Tumblr.search(search_params)
      self.new(results: feed[:big_ugly_hash][:authors], successful: feed[:posts] != 0, provider: :tumblr )

    when "twitter"
      #Searches by Twitter
      feed = TwitterFeed.search(search_params)

    end
  end
end
