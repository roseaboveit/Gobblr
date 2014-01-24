class AddingDateIndex < ActiveRecord::Migration
  def change
    add_index :posts, :published
  end
end
