class Feeder < Feed
  def self.search(feed_search)
    Feedzirra::Feed.fetch_and_parse(feed_search)  
  end

  def self.set_posts(feed_url, id)
    Feedzirra::Feed.fetch_and_parse(feed_url).entries.each do |post|
      @post = Post.create(author: post[:author], title: post[:title], published: post[:published], url: post[:url], content: post[:content], summary: post[:summary], feed_id: id)
    end
  end

end
