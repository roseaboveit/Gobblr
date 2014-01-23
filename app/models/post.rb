class Post < ActiveRecord::Base
  validates :author, :type, :content, :published, presence: true

  def self.search_bar(feed_search=nil,twitter_search=nil)
    if feed_search
      Feedzirra::Feed.fetch_and_parse(feed_search).entries
    elsif twitter_search
      Twitter.find_users(twitter_search)
    else
     Post.all
    end
  end
end
