class TwitterFeed < Feed
  require 'twitter'
  attr_accessor :client

<<<<<<< HEAD
  def self.set_home_tweets(token, secret, username)
    @feed = Feed.find_by(identifier: "#{username}_home_feed")
    if (Time.now - @feed.updated_at) > 300
      @twitter_user = TwitterFeed.generate_client(token, secret)

      @twitter_user.home_timeline.each do |post|
        if @feed.posts.where(url: post[:url].to_s).count == 1
        else
          @post = Post.create(author: post.user.screen_name,
                              aurl: post.user.profile_image_url.to_s,
                              published: post['created_at'],
                              content: post.text,
                              content_type: 'text',
                              url: post[:url].to_s, 
                              feed_id: @feed.id,
                              tweet_id: post.id)
        end
      end
    end
  rescue Twitter::Error::TooManyRequests
  end

  def self.search(twitter_search)
    @client = TwitterFeed.generate_client
    @client.user_search(twitter_search)
  rescue Twitter::Error::TooManyRequests
    {}
  end

  private

  def self.set_posts(twitter_identifier, id)
    @client = TwitterFeed.generate_client
    bunch_of_posts = @client.user_timeline(twitter_identifier)

    bunch_of_posts.each do |post|
      Post.create(author:       post.user.screen_name,
                  aurl:         post.user.profile_image_url.to_s,
                  published:    post['created_at'],
                  feed_id:      id,
                  content:      post.text,
                  content_type: "text",
                  url:          post[:url].to_s,
                  tweet_id:     post.id)
    end
  rescue Twitter::Error::TooManyRequests
  end

  def self.generate_client(token = ENV['TWITTER_ACCESS_TOKEN'], secret = ENV['TWITTER_ACCESS_TOKEN_SECRET'])
    Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = token
      config.access_token_secret = secret
    end
  end
end
