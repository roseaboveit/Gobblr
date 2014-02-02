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

  def fave_tweet(post, token, secret)
    individual = TwitterFeed.generate_client(token, secret)
    tweet = TwitterFeed.generate_client.status(post.tweet_id)
    if !individual.status(post.tweet_id).favorited
      individual.favorite!tweet
    else
      individual.unfavorite(tweet)
    end
    rescue Twitter::Error::TooManyRequests
  end

  def retweet(post, token, secret)
    TwitterFeed.generate_client(token, secret).retweet(TwitterFeed.generate_client.status(post.tweet_id))
  rescue Twitter::Error::TooManyRequests
  end

  def is_it_retweeted(current_user)
    TwitterFeed.generate_client(current_user.token, current_user.secret).status(tweet_id).retweeted
    rescue Twitter::Error::TooManyRequests
  end

  def its_a_fave(current_user)
    TwitterFeed.generate_client(current_user.token, current_user.secret).status(tweet_id).favorited
    rescue Twitter::Error::TooManyRequests
  end
end
