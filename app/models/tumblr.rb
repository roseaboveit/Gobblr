class Tumblr < Feed

  def self.search(tumblr_name)
    tumblr_name.chomp!(".tumblr.com")
    walloftext = HTTParty.get("http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/info?api_key=#{Figaro.env.tumblr_key}")
    if walloftext['response'].length != 0
      { title:       walloftext['response']['blog']['title'], 
        author:      walloftext['response']['blog']['name'],
        url:         walloftext['response']['blog']['url'],
        post_count:  walloftext['response']['blog']['posts'],
        time:        walloftext['response']['blog']['updated'],
        description: walloftext['response']['blog']['description'],
        avatar:      "http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/avatar/96" }
    else
      0
    end
  end

  def self.set_posts(feed_url, id)
    post_hash = HTTParty.get("http://api.tumblr.com/v2/blog/#{feed_url}.tumblr.com/posts?api_key=#{Figaro.env.tumblr_key}&notes_info=true")['response']['posts']
    post_hash.each do |post|
      if Feed.find(id).posts.where(url: post[:url]).count == 1
      else
        @post = Post.create(author: post['blog_name'], published: post['date'], url: post['post_url'], feed_id: id, content_type: post['type'], aurl: "http://api.tumblr.com/v2/blog/#{post['blog_name']}.tumblr.com/avatar/96")
        if post['type'] == 'photo'
          photo_string = ""
          post['photos'].map {|photo| photo_string += " " + photo['alt_sizes'][1]['url'] }
          @post.content = photo_string.strip
        elsif post['type'] == 'text' || post['type'] == 'quote' || post['type'] == 'chat'
          @post.content = post['body'] if post['body']
          @post.content = post['text'] if post['text']
          @post.quote_source = post['source'] if post['source']
        elsif post['type'] == 'link'
          @post.summary = post['description']
          @post.content = post['url']
        elsif post['type'] == 'audio'
          @post.artist = post['artist']
          @post.title = post['track_name']
          @post.album_art = post['album_art']
          @post.embed = post['embed']
        elsif post['type'] == 'video'
          @post.embed = post['player'][2]['embed_code']
        end
        @post.summary = post['caption'] if post['caption']
        @post.title = post['title'] if post['title']
        @post.save
      end
    end
  end
end