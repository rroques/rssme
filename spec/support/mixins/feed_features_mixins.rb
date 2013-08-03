module FeedHelpers

  def create_feed(name, url)
    click_link('+')
    fill_in('Name', :with => name)
    fill_in('Url', :with => url)
    click_button('Create Feed') 
    current_path.should == feeds_path
  end

  def update_feed(old_name, new_name, url)
    click_link(old_name)
    find_link('Edit').click()
    fill_in('Name', :with => new_name)
    fill_in('Url', :with => url)
    click_button('Update Feed') 
    current_path.should == feeds_path
  end

end