class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path, notice: "Failed to save the user"
      end
    else
      redirect_to root_path, notice: "Failed to authenticate"
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end