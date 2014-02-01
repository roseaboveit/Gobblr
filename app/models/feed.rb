class Feed < ActiveRecord::Base
  has_many :feed_users
  has_many :users, through: :feed_users
  has_many :posts
  validates :type, presence: true
  validates :identifier, presence: true, uniqueness: true

  
end
