class Feeder < Feed
  def self.search(feed_search)
    Feedzirra::Feed.fetch_and_parse(feed_search)
  end
end