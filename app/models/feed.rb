require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :name, :url
  validates :name, :url, :presence => true
  validates_format_of :url, :with => URI::regexp(%w(http rss))

  def feed
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
    end 
  end  

end
