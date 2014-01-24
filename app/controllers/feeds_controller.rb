class FeedsController < ApplicationController
  def new
  end

  def create
    @feed = current_user.feeds.create(feed_params)
    if @feed.save
      redirect_to root_path
    else
      redirect_to :back, notice: 'This did not save.'
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:identifier, :user_id=>{})
  end
end