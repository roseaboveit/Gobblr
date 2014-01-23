class Feeder < Post
  def self.search(feed_search)
    Feedzirra::Feed.fetch_and_parse(feed_search).entries
  end
end