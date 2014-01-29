class User < ActiveRecord::Base
  has_many :feed_users
  has_many :feeds, through: :feed_users
  has_many :posts, through: :feeds
  has_many :authorizations

  def self.find_or_create_from_omniauth(auth_hash)
    @user = User.find_by(username: auth_hash['info']['name'])
    @user.update(token: auth_hash["credentials"]["token"])
    @user.update(secret: auth_hash["credentials"]["secret"])
  end

  def self.create_from_omniauth(auth_hash)
    self.create!(      
    username: auth_hash["info"]["name"],
    token:    auth_hash["credentials"]["token"],
    secret:   auth_hash["credentials"]["secret"]
    )
    rescue ActiveRecord::RecordInvalid
      nil
  end
end