class CreateReadItems < ActiveRecord::Migration
  def change
    create_table :read_items do |t|
      t.integer :item_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
