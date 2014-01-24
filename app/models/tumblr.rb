class Tumblr < Post

  def self.search(tumblr_name)
    walloftext = HTTParty.get("http://api.tumblr.com/v2/blog/#{tumblr_name}.tumblr.com/info?api_key=#{Figaro.env.tumblr_key}")
    @posts = { title: walloftext['response']['blog']['title'], 
                author: walloftext['response']['blog']['name'],
                url: walloftext['response']['blog']['url'],
                post_count: walloftext['response']['blog']['posts'],
                time: walloftext['response']['blog']['updated'],
                description: walloftext['response']['blog']['description']
              }
  end
end