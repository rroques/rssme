require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :name, :url, :items
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

  def name_unread_items
    "#{name} #{number_unread_items}"
  end

  private

  def number_unread_items
    unread_cound = items.size - read_items.size
    if unread_cound > 0 then "<span class='badge'>#{unread_cound}</span>" else "" end
  end

end
