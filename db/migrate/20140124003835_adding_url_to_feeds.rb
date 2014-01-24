class AddingUrlToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :url, :string
    add_column :feeds, :description, :text
  end
end
