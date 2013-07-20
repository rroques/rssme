require 'spec_helper'

describe ReadItemsController do

  before(:each) do 
    @item = FactoryGirl.create(:item)
    @valid_attributes = {:feed_id => @item.feed.to_param, :item_id => @item.to_param}
    sign_in_as @item.feed.user
  end  

  describe "POST create" do
    it "creates a read_item instance" do
      post :create, {:read_item => @valid_attributes}
      response.should be_success
    end

    it "fails to create a read_item instance" do
      post :create, {:read_item => {:feed_id => @item.feed.to_param}}
      response.should_not be_success
    end
  end

end
