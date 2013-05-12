class ReadItem < ActiveRecord::Base

  attr_accessible :feed_id, :item_id

  validates :feed_id, :presence => true
  validates :item_id, :presence => true

  belongs_to :feed
  belongs_to :item

end
