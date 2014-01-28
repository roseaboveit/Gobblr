class Tumblr < Feed

  def self.search(tumblr_name)
    walloftext = HTTParty.get("http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/info?api_key=#{Figaro.env.tumblr_key}")
    posts = HTTParty.get("http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/posts?api_key=#{Figaro.env.tumblr_key}&notes_info=true")
    unless walloftext['response'].length == 0
      @search = { title: walloftext['response']['blog']['title'], 
                  author: walloftext['response']['blog']['name'],
                  url: walloftext['response']['blog']['url'],
                  post_count: walloftext['response']['blog']['posts'],
                  time: walloftext['response']['blog']['updated'],
                  description: walloftext['response']['blog']['description'],
                  avatar: "http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/avatar/96" }
    else
      @search = 0
    end
  end

  def self.set_posts(feed_url, id)
    post_hash = HTTParty.get("http://api.tumblr.com/v2/blog/#{feed_url}.tumblr.com/posts?api_key=#{Figaro.env.tumblr_key}&notes_info=true")['response']['posts']
    post_hash.each do |post|
      @post = Post.create(author: post['blog_name'], published: post['date'], url: post['post_url'], feed_id: id, content_type: post['type'])
      if post['type'] == 'photo'
        photo_string = ""
        post['photos'].map {|photo| photo_string += " " + photo['alt_sizes'][1]['url'] }
        @post.summary = post['caption']
        @post.content = photo_string.strip
      elsif post['type'] == 'text' || post['type'] == 'quote'
        @post.title = post['title']
        @post.content = post['body'] if post['body']
        @post.content = post['text'] if post['text']
        @post.quote_source = post['source'] if post['source']
      elsif post
      end
      @post.save
    end
  end
end