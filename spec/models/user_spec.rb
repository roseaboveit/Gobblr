require 'spec_helper'

  describe User do
    describe "validations" do
      it "is valid" do
        expect(build(:user)).to be_valid
      end

      it 'needs a name' do
        expect(build(:user, username: nil)).to be_invalid
      end

      it 'needs a token' do
        expect(build(:user, token: nil)).to be_invalid
      end

      it 'needs a security input' do
        expect(build(:user, secret: nil)).to be_invalid
      end
    end

    describe 'methods' do

      # Can we do this without using the omniauth request thingy?
      describe 'find_or_create_from_omniauth' do
        it 'finds a user that exists' do
        end
      end

      describe 'create_from_omniauth' do
        it 'creates a new user' do
        end
      end

    end
  end


  #   def self.find_or_create_from_omniauth(auth_hash)
  #   @user = User.find_by(username: auth_hash['info']['name'])
  #   @user.update(token: auth_hash["credentials"]["token"])
  #   @user.update(secret: auth_hash["credentials"]["secret"])
  # end

  # def self.create_from_omniauth(auth_hash)
  #   self.create!(      
  #   username: auth_hash["info"]["name"],
  #   token:    auth_hash["credentials"]["token"],
  #   secret:   auth_hash["credentials"]["secret"]
  #   )