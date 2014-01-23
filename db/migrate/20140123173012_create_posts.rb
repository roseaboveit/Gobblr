class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :type
      t.string :content
      t.string :url
      t.string :title
      t.datetime :published

      t.timestamps
    end
  end
end
