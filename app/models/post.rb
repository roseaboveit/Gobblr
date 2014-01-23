class Post < ActiveRecord::Base

  def search_tumblr_users(tumblr_name)
    Tumblr.search(tumblr_name)
  end
end
