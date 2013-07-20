require 'spec_helper'

describe ItemsController do

  before(:each) do 
    @valid_attributes = attributes_for(:user)
    @item = FactoryGirl.create(:item)
    sign_in_as @item.feed.user
  end  

  describe "GET show" do
    it "assigns the requested item as @item" do
      get :show, {:id => @item.to_param}
      assigns(:item).should eq(@item)
    end

    it "should return successful JSON response" do
      request.accept = "application/json"
      get :show, {:id => @item.to_param}
      response.should be_success
    end

    it "should return unsuccessful HTML response" do
      request.accept = "application/html"
      get :show, {:id => @item.to_param}
      response.should_not be_success
    end
  end

end
