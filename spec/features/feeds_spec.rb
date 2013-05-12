require 'spec_helper'


describe "Feeds" do
  
  before(:each) do
    login
  end  

  describe "Home page" do
    
    it "should list all feeds, initially none" do
      visit feeds_url
      page.should_not have_selector('table.feedList tbody tr')
      page.find_link('Add a new Feed').visible?.should be_true
    end

  end

  describe "Add a feed" do
    
    include FeedHelpers

    it "should list all feeds, initially none" do
      visit feeds_url
      page.should_not have_selector('table.feedList tbody tr')
      click_link('Add a new Feed')
      current_path.should == new_feed_path
      create_feed('my feed', 'http://domain.com/file.rss')
      current_path.should == feeds_path
      # page.should have_content('Could not load the feed items, please check the url.')
    end

  end


end
