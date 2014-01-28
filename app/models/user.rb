class User < ActiveRecord::Base
  has_many :feed_users
  has_many :feeds, through: :feed_users
  has_many :posts, through: :feeds
  has_many :authorizations

  def self.find_or_create_from_omniauth(auth_hash)
    @user = User.find_by(email: auth_hash["info"]["email"], username: auth_hash['info']['name'])
  end

  def self.create_from_omniauth(auth_hash)
    self.create!(      
    username: auth_hash["info"]["name"],
    email:    auth_hash["info"]["email"]
    )
    rescue ActiveRecord::RecordInvalid
      nil
  end
end