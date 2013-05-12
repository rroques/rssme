require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :name, :url
  validates :name, :url, :presence => true
  validates_format_of :url, :with => URI::regexp(%w(http https rss))

  belongs_to :user
  validates :user_id, presence: true
  
  has_many :items, :dependent => :destroy

  has_many :read_items 
  has_many :read_item_flags, :through => :read_items, :source => :item

  def items_to_show
    items.order('pub_date DESC')
  end  

end
