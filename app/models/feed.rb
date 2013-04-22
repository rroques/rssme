require 'rss'
require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :name, :url
  validates :name, :url, :presence => true
  validates_format_of :url, :with => URI::regexp(%w(http rss))

  belongs_to :user
  validates :user_id, presence: true
  

  def feed
    begin
      open(url) do |rss|
        feed = RSS::Parser.parse(rss)
      end
    rescue
      logger.info 'Could not load feed #{url}'
      nil
    end   
  end  

end
