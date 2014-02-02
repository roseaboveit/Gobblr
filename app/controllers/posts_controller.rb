class PostsController < ApplicationController

  def fave
    post = Post.find(params[:id])
    post.fave_tweet(post, @current_user.token, @current_user.secret)
    redirect_to home_path
  rescue Twitter::Error::TooManyRequests
  end

  def retweet
    post = Post.find(params[:id])
    post.retweet(post, @current_user.token, @current_user.secret)
    redirect_to home_path
  rescue Twitter::Error::TooManyRequests
  end  
end