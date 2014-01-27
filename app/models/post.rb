class Post < ActiveRecord::Base
  belongs_to :feed
  validates :published, presence: true

  def self.search_bar(feed_search=nil,twitter_search=nil, search_tumblr=nil)
    if feed_search
      Feeder.search(feed_search)
    elsif search_tumblr
      Tumblr.search(search_tumblr)
    elsif twitter_search
      TwitterFeed.search(twitter_search)
    end
  end

  # def fix_photo_mess
  #   photo_string = ""
  #   photo_hash.map {|photo| photo_string += " " + photo['alt_sizes'][1]['url'] }
  #   content:['photos'] = photostring
  # end
end
