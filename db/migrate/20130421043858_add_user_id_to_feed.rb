class AddUserIdToFeed < ActiveRecord::Migration
  def change
    Feed.delete_all
    add_column :feeds, :user_id, :integer, :null => false
  end
end
