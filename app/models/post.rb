class Post < ActiveRecord::Base
  belongs_to :feed
  validates :author, :content, :published, presence: true

  def self.search_bar(feed_search=nil,twitter_search=nil, search_tumblr=nil)
    if feed_search
      Feeder.search(feed_search)
    elsif twitter_search
      Twitter.find_users(twitter_search)
    elsif search_tumblr
      Tumblr.search(search_tumblr)
    else
      Post.all
    end
  end

end
