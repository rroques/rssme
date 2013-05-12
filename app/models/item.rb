class Item < ActiveRecord::Base
  attr_accessible :content, :pub_date, :title
  validates :content, :pub_date, :title, presence: true

  belongs_to :feed
  validates :feed_id, presence: true

end
