class Feed < ActiveRecord::Base
  has_many :feed_users
  has_many :users, through: :feed_users
end
