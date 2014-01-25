class Post < ActiveRecord::Base
  belongs_to :feed
  validates :author, :content, :published, presence: true

  def self.search_bar(feed_search=nil,twitter_search=nil)
    if feed_search
        Feeder.search(feed_search)
    elsif twitter_search
      TwitterFeed.search(twitter_search)
    else
    end
  end

end
