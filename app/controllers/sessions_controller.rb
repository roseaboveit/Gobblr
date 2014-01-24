class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to home_path(@user.id), notice: "You have been successfully signed in."
      else
        redirect_to root_path, notice: "Failed to save the user"
      end
    else
      redirect_to root_path, notice: "Failed to authenticate"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully signed out."
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end