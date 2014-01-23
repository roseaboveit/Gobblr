class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def show
    require 'will_paginate/array'
    @posts = Post.search_bar(params[:feeder_params],params[:twitter_params]).paginate(page: params[:page])
  end
end
