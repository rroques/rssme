class ChangeFeedPubDateToDatetime < ActiveRecord::Migration
  def up
     change_column :items, :pub_date, :datetime
  end

  def down
     change_column :items, :pub_date, :date
  end
end
