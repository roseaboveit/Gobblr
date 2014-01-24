class AddTypeToFeedAndRemoveFromPosts < ActiveRecord::Migration
  def change
    add_column :feeds, :type, :string
    remove_column :posts, :type
  end
end
