class AddUniqueReadItemKey < ActiveRecord::Migration
  def up
    ReadItem.delete_all
    change_column :read_items, :feed_id, :integer, :null => false 
    change_column :read_items, :item_id, :integer, :null => false 
    add_index :read_items, [ :feed_id, :item_id ], :unique => true, :name => 'read_items_unique'
  end

  def down
  end
end
