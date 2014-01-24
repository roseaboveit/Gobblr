class Feeder < Feed
  def self.search(feed_search)
    Feedzirra::Feed.fetch_and_parse(feed_search)
  end

  def self.set_posts(feed_url, id)
    Feedzirra::Feed.fetch_and_parse(feed_url).entries.each do |post|
      @post = Post.create(author: post[:author], content: post[:content], title: post[:title], published: post[:published], url: post[:url], summary: post[:summary], feed_id: id)
      if @post.save
      else
        raise
      end
    end
  end
end
