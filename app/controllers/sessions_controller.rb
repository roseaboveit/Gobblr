class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by(uid: auth_hash["uid"])
    if @authorization
      session[:user_id] = @authorization.user_id
      Feed.update
      redirect_to home_path(session[:user_id]), notice: "You have been successfully signed in."
    elsif current_user
      authorization = Authorization.create_from_omniauth(auth_hash)
      current_user.authorizations << authorization
      redirect_to home_path(session[:user_id]), notice: "You have added an account."
    else
      user = User.create_from_omniauth(auth_hash)
      session[:user_id] = user.id
      authorization = Authorization.create_from_omniauth(auth_hash)
      user.authorizations << authorization
      current_user
      redirect_to twitter_feed_create_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully signed out."
  end
end
