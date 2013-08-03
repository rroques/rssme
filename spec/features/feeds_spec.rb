require 'spec_helper'
require 'clearance/testing'


describe "CRUD Feeds", :js => true do
  
  before(:each) do
    login
  end  

  describe "Add a feed" do
    include FeedHelpers

    it "should increase the number of feeds by one" do
      expect {
        create_feed('my feed', 'http://domain.com/file.rss')
      }.to change(Feed, :count).by(1)
    end
  end

  describe "Delete a feed" do
    include FeedHelpers

    it "should decrease the number of feeds by one" do
      create_feed('my feed', 'http://domain.com/file.rss')
      expect {
        click_link('my feed')
        find_link('Delete').click()
      }.to change(Feed, :count).by(-1)
    end
  end

  describe "Edit a feed" do
    include FeedHelpers

    it "should change its name" do
      create_feed('my feed', 'http://domain.com/file.rss')
      update_feed('my feed', 'new name', 'http://domain.com/file.rss')
      page.should have_link 'new name'
      expect {
        click_link('new name')
        find_link('Delete').click()
      }.to change(Feed, :count).by(-1)
    end
  end


end
