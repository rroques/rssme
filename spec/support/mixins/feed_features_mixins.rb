module FeedHelpers

  def create_feed(name, url)
    fill_in('Name', :with => name)
    fill_in('Url', :with => url)
    click_button('Create Feed') 
  end

end