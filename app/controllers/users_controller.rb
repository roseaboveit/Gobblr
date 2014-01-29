class UsersController < ApplicationController
  def show
    @search = Post.search_bar(params[:feeder_params],params[:twitter_params], params[:search_tumblr],@current_user.token, @current_user.secret,@current_user.username)
    @feed = Feed.new
    @posts = @current_user.posts.order('published DESC')
    if @search == 0 || @search == 404
      flash.now[:notice] = 'No match found.'
      @search = 0
    end
  end


end
