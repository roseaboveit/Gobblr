class Post < ActiveRecord::Base
  belongs_to :feed
  validates :published, :feed_id, presence: true

  def self.search_bar(search_params = nil, search_type, token, secret, username)
    TwitterFeed.update_home_tweets(token,secret,username)
    case search_type
    when 'all'
      # Searches All
      { feed: Feeder.search(search_params), tumblr: Tumblr.search(search_params), twitter: TwitterFeed.search(search_params) }
    when 'feed'
      # Searches by Feed
      { feed: Feeder.search(search_params) }
    when 'tumblr'
      # Searches by Tumblr
      { tumblr: Tumblr.search(search_params) }
    when 'twitter'
      # Searches by Twitter
      { twitter: TwitterFeed.search(search_params) }
    end
  end

  def fave_tweet(post, token, secret)
    TwitterFeed.generate_client(token, secret).favorite!(post.tweet_id)
  rescue Twitter::Error::TooManyRequests
  rescue Twitter::Error::AlreadyFavorited
  end

  def unfave_tweet(post, token, secret)
    TwitterFeed.generate_client(token, secret).unfavorite(post.tweet_id)
  rescue Twitter::Error::TooManyRequests
  #This oddly named error is what comes up if you try to unfavorite a tweet you've already unfavorited elsewhere since the page his been refreshed
  rescue Twitter::Error::NotFound
  end

  def retweet(post, token, secret)
    TwitterFeed.generate_client(token, secret).retweet(post.tweet_id)
  rescue Twitter::Error::TooManyRequests
  #This oddly named error is what comes up if you try to retweet a tweet you've already retweeted elsewhere since the page his been refreshed
  rescue Twitter::Error::Forbidden
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
