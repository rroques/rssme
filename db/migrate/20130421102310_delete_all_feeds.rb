class DeleteAllFeeds < ActiveRecord::Migration
  def up
    Feed.delete_all
  end

  def down
  end
end
