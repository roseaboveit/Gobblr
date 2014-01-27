class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :email
      t.string :avatar
      t.string :nickname

      t.timestamps
    end
  end
end
