class AddFeedIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :feed_id, :integer, :null => false
  end
end
