class Feed < ActiveRecord::Base
  has_many :feed_users
  has_many :users, through: :feed_users
  has_many :posts
  validates :type, presence: true
  validates :identifier, presence: true, uniqueness: true

  def self.update
    Feed.all.each do |feed|
      if feed.type == TwitterFeed && feed.identifier.include?(/_help_line/)
      else
      feed.type.constantize.set_posts(feed.identifier, feed.id)
      end
    end
  end

end
