require 'spec_helper'


describe "Feeds" do
  
  before(:each) do
    login
  end  

  describe "Index feeds" do
    
    it "should list all feeds" do
      feed = FactoryGirl.create(:feed)
      feed.save
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit feeds_url
       
      page.should have_content("feed name") 
    end

  end
end
