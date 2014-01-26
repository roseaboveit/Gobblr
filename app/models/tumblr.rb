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
                  #avatar: HTTParty.get("http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/avatar/512")
                }
    else
      @search = 0
    end
  end

  def self.set_posts(feed_url, id)
    raise
    HTTParty.get("http://api.tumblr.com/v2/blog/#{feed_url}.tumblr.com/posts?api_key=#{Figaro.env.tumblr_key}&notes_info=true")['response']['posts'].each do |post|
      @post = Post.create(author: post['blog_name'], title: post['title'], published: post['date'], url: post['post_url'], feed_id: id)
      @post.content = post['body'] if post['body']
      #add tags, maybe notes, and formatting for if not text.
      @post.save
    end
  end
end