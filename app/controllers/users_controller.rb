class UsersController < ApplicationController
  def show
    @search = Post.search_bar(params[:search_params], params[:search_type], @current_user.token, @current_user.secret, @current_user.username)
    @feed = Feed.new
    @posts = @current_user.posts.order('published DESC')
    if @search != nil
      if (@search[:feed] == 0 || @search[:feed] == 404)
        flash.now[:notice] = 'Invalid feed URL. Please try again.'
        flash.now[:feed_notice] = 'Invalid feed URL. Please try again.'
        @search[:feed] = 0
      end
      if @search[:tumblr] == 0
        flash.now[:notice] = 'No tumblr match found.'
        flash.now[:tumblr_notice] = 'No tumblr match found.'
      end
    end
  end
end
