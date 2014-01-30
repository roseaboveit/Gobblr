class Post < ActiveRecord::Base
  belongs_to :feed
  validates :published, :feed_id, presence: true

  def self.search_bar(search_params=nil, search_type, token,secret,username)
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
      { tumblr: Tumblr.search(search_params) }
    when "twitter"
      #Searches by Twitter
      { twitter: TwitterFeed.search(search_params) }
    end
  end
end
