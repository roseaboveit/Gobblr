class AddFieldsForTumblrAudioAndMakeStringsText < ActiveRecord::Migration
  def change
    add_column :posts, :artist, :text
    add_column :posts, :track_name, :text
    add_column :posts, :album_art, :text
    add_column :posts, :embed, :text
    change_column :posts, :url, :text
    change_column :posts, :title, :text
    change_column :posts, :quote_source, :text
  end
end
