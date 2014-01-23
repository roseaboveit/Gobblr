class Post < ActiveRecord::Base
  validates :author, :type, :content, :published, presence: true

  def self.search_bar(feed_search=nil,twitter_search=nil)
    if feed_search
      Feeder.search(feed_search)
    elsif twitter_search
      Twitter.find_users(twitter_search)
    else
     Post.all
    end
  end

  def search_tumblr_users(tumblr_name)
    Tumblr.search(tumblr_name)
  end
end
