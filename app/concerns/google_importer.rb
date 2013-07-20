module GoogleImporter

  def import_from_google(file)
    existing_feeds = current_user.feeds.map { |e| e.url }
    xml_doc = Nokogiri::XML(file)
    xml_doc.xpath('//outline').each do |node|
      title = node.attr('title')
      url = node.attr('xmlUrl')
      if not existing_feeds.include? url
        params = { :name => title, :url => url}
        feed = current_user.feeds.new(params)
        if feed.save
           puts "Saved #{title}"
        else
          puts "Issue saving #{title}"
          puts feed.errors
        end

      else
       puts "User already suscribes to #{title}"
     end
   end

 end  

end