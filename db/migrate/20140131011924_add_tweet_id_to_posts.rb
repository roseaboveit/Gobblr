class AddTweetIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tweet_id, :string
  end
end
