class WelcomeController < ApplicationController
  def index
      redirect_to home_path(@current_user.id) if @current_user
  end
end
