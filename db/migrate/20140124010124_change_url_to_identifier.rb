class ChangeUrlToIdentifier < ActiveRecord::Migration
  def change
    remove_column :feeds, :url
    add_column :feeds, :identifier, :string
  end
end
