class AddFeedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :feed, :integer
  end
end
