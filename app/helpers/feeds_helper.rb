require 'json'

module FeedsHelper


  def item_link(item)
   JSON.parse(item.content)['link']
  end  
  
  def item_pub_date(item)
   JSON.parse(item.content)['pubDate']
  end

  def item_content(item)
   JSON.parse(item.content)['description']
  end

  def item_class(feed, item)
    if feed.read_item_flags.include? item 
      'read' 
    end
  end 

  def number_unread_items(feed)
    unread_cound = feed.items.size - feed.read_items.size
    if unread_cound > 0 then "(#{unread_cound})" else "" end
  end

end  