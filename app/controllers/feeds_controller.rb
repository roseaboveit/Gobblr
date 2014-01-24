class FeedsController < ApplicationController
  def new
  end

  def create
    @feed = Feed.find_or_create_by(identifier: params[:feed][:identifier])
    @feed.type = params[:feed][:type]
    if @feed.save
      current_user.feeds << @feed unless current_user.feeds.include? @feed
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