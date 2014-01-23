class Tumblr < Post

  def self.search(tumbr_name)
    walloftext = HTTParty.get('http://api.tumblr.com/v2/blog/#{tumblr_name}/info?api_key=Figaro.env.tumblr_key')
  end
end