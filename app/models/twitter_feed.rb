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
    @client.user_search(twitter_search)
  end

  def self.set_posts(twitter_identifier, id)
    bunch_of_posts = @client.user_timeline(twitter_identifier)
    bunch_of_posts.each do |post|
      @post = Post.create(author: post.user.screen_name, aurl: post.user.profile_image_url.to_s, published: post['created_at'], feed_id: id, content: post.text, content_type: "text", url: post[:url].to_s)
    end
    @posts
  end
end
