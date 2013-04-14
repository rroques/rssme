require 'spec_helper'


describe "Feeds" do
  
  before(:each) do
    login_via_post
  end  

  describe "GET /feeds" do
    it "get all feeds" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get feeds_path
      response.status.should be(200)
    end
  end
end
