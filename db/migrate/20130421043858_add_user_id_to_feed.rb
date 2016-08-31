class AddUserIdToFeed < ActiveRecord::Migration
  def change
    Feed.delete_all
    add_column :feeds, :user_id, :integer
  end
end
