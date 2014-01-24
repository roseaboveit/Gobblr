class ChangingStringToTextForSummaryContent < ActiveRecord::Migration
  def change
    change_column :posts, :summary, :text
    change_column :posts, :content, :text
  end
end
