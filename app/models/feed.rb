class Feed < ActiveRecord::Base
  has_many :feed_users
  has_many :users, through: :feed_users
  has_many :posts
  validates :type, presence: true
  validates :identifier, presence: true, uniqueness: true

  # This does not work.FIX.
  # def self.update_feeds(username)
  #   Feed.all.each do |feed|
  #     if feed.type == 'TwitterFeed' && feed.identifier == "#{username}_home_feed"
  #       TwitterFeed.set_home_tweets(feed.identifier, feed.id)
  #     elsif feed.type == 'TwitterFeed'
  #       TwitterFeed.set_posts(feed.identifier, feed.id)
  #       raise
  #     elsif feed.type == 'Feeder'
  #       Feeder.set_posts(feed.identifier, feed.id)
  #     end
  #   end
  # end
end
