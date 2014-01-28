class AddAurlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :aurl, :string
  end
end
