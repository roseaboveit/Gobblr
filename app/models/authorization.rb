class Authorization < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_from_omniauth(auth_hash)
    Authorization.find_by(uid: auth_hash["uid"], provider: auth_hash['provider']) || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    self.create!(
      uid:      auth_hash["uid"],
      provider: auth_hash["provider"],
      email:    auth_hash["info"]["email"],
      avatar: auth_hash["info"]["image"],
      nickname: auth_hash["info"]["nickname"]
    )
  rescue ActiveRecord::RecordInvalid
    nil
  end
end

