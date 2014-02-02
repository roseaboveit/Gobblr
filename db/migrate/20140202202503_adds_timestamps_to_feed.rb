class AddsTimestampsToFeed < ActiveRecord::Migration
  def change
    add_timestamps :feeds 
  end
end
