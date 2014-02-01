class PostsController < ApplicationController

  def fave
    post = Post.find(params[:id])
    post.fave_tweet(post, @current_user.token, @current_user.secret)
    redirect_to home_path
  end
  
end