require 'rss'
require 'open-uri'
require 'json'

class LoadFeedItem

  @queue = :load_feed_item 
  
  def self.perform
    puts "Starting LoadFeedItem"
    Feed.all.each do |feed| 
      begin 
        doHandleFeed(feed)
      rescue Exception => e
        puts "\tError #{e}"
      end
    end
    puts "Finished LoadFeedItem"
  end


  def self.doHandleFeed(feed)
    puts "Loading items for #{feed.name}"

    if feed.items.empty?
      latest_item_pub_date = Time.at(0)
    else   
      latest_item_pub_date = feed.items.first(:order => 'pub_date DESC').pub_date
    end

    saved = 0
    ignored = 0

    open(feed.url) do |rss|
      parsed_feed = RSS::Parser.parse(rss)
      parsed_feed.items.each do |item|

        if item.pubDate > latest_item_pub_date 
          item_params = {
            :title => item.title,
            :pub_date => item.pubDate,
            :content => JSON.dump(item)
          }
          it = feed.items.new(item_params)
          if it.save
            saved = saved + 1
          else
            raise it.errors
          end  
        else 
          ignored = ignored + 1
        end  
      end
    end

    puts "\t=> New [#{saved}] Ignored [#{ignored}]"
  end
end