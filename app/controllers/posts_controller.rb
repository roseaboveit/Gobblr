class PostsController < ApplicationController

  def fave
    @post = Post.find(params[:id])
    @post.fave_tweet
  end
  
end