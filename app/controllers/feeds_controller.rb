class FeedsController < ApplicationController
  def new
  end

  def create
    @feed = Feed.find_or_create_by(identifier: params[:feed][:identifier])
    @feed.type = params[:feed][:type]
    if @feed.save
        unless current_user.feeds.include? @feed      
          current_user.feeds << @feed
          find_posts(@feed.identifier, @feed.id)
        end
      redirect_to root_path
    else
      redirect_to :back, notice: 'This did not save.'
    end
  end

  def add_home_twitter_feed
    current_user
    @feed = Feed.find_or_create_by(identifier: "#{@current_user.username}_home_feed")
    @feed.type = 'TwitterFeed'
      if @feed.save
        current_user.feeds << @feed
      else
        redirect_to redirect_to root_path, notice: 'Your twitter feed is not accessible at this time'
      end
    redirect_to home_path(@current_user.id), notice: "You have been successfully signed in."
  end

  private

  def feed_params
    params.require(:feed).permit(:identifier, :user_id=>{})
  end

  def find_posts(feed_identifier, id)
    if @feed.type == 'Feeder'
      Feeder.set_posts(feed_identifier, id)
    elsif @feed.type == 'Tumblr'
      Tumblr.set_posts(feed_identifier, id)
    elsif @feed.type == 'TwitterFeed'
      TwitterFeed.set_posts(feed_identifier, id)
    end
  end
end