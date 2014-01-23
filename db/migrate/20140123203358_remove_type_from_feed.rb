class RemoveTypeFromFeed < ActiveRecord::Migration
  def change
    remove_column :feeds, :type, :string
  end
end
