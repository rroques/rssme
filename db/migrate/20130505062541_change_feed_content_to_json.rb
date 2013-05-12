class ChangeFeedContentToJson < ActiveRecord::Migration
  def up
    change_column :items, :content, :text
  end

  def down
    change_column :items, :content, :xml
  end
end
