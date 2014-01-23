class CreateFeed < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :type
    end
  end
end
