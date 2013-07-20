require 'spec_helper'

describe FeedsController do

  def valid_attributes
    { "name" => "MyString", :url => 'http://domain.com/rss' }
  end

  def valid_session
    {}
  end

  before(:each) do 
    @feed = FactoryGirl.create(:feed)
    sign_in_as @feed.user
  end  

  describe "GET index" do
    it "assigns all feeds as @feeds" do
      get :index, {}, valid_session
      assigns(:feeds).should eq([@feed])
    end
  end

  describe "GET show" do
    it "assigns the requested feed as @feed" do
      get :show, {:id => @feed.to_param}, valid_session
      assigns(:feed).should eq(@feed)
    end

    it "redirect to root_url if current user" do
      sign_in_as FactoryGirl.create(:user)
      get :show, {:id => @feed.to_param}, valid_session
      response.should redirect_to(root_url)
    end  
  end

  describe "GET new" do
    it "assigns a new feed as @feed" do
      get :new, {}, valid_session
      assigns(:feed).should be_a_new(Feed)
    end
  end

  describe "GET edit" do
    it "assigns the requested feed as @feed" do
      get :edit, {:id => @feed.to_param}, valid_session
      assigns(:feed).should eq(@feed)
    end

    it "redirect to root_url if current user" do
      sign_in_as FactoryGirl.create(:user)
      get :edit, {:id => @feed.to_param}, valid_session
      response.should redirect_to(root_url)
    end  
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Feed" do
        expect {
          post :create, {:feed => valid_attributes}, valid_session
        }.to change(Feed, :count).by(1)
      end

      it "assigns a newly created feed as @feed" do
        post :create, {:feed => valid_attributes}, valid_session
        assigns(:feed).should be_a(Feed)
        assigns(:feed).should be_persisted
      end

      it "redirects to the created feed" do
        post :create, {:feed => valid_attributes}, valid_session
        response.should redirect_to(feeds_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feed as @feed" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feed.any_instance.stub(:save).and_return(false)
        post :create, {:feed => { "name" => "invalid value" }}, valid_session
        assigns(:feed).should be_a_new(Feed)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feed.any_instance.stub(:save).and_return(false)
        post :create, {:feed => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested feed" do
        # Assuming there are no other feeds in the database, this
        # specifies that the Feed created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Feed.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => @feed.to_param, :feed => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested feed as @feed" do
        put :update, {:id => @feed.to_param, :feed => valid_attributes}, valid_session
        assigns(:feed).should eq(@feed)
      end

      it "redirects to the feed" do
        put :update, {:id => @feed.to_param, :feed => valid_attributes}, valid_session
        response.should redirect_to(feeds_url)
      end

      it "redirect to root_url if current user" do
        sign_in_as FactoryGirl.create(:user)
        put :update, {:id => @feed.to_param, :feed => valid_attributes}, valid_session
        response.should redirect_to(root_url)
      end 
    end

    describe "with invalid params" do
      it "assigns the feed as @feed" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feed.any_instance.stub(:save).and_return(false)
        put :update, {:id => @feed.to_param, :feed => { "name" => "invalid value" }}, valid_session
        assigns(:feed).should eq(@feed)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feed.any_instance.stub(:save).and_return(false)
        put :update, {:id => @feed.to_param, :feed => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested feed" do
      expect {
        delete :destroy, {:id => @feed.to_param}, valid_session
      }.to change(Feed, :count).by(-1)
    end

    it "redirects to the feeds list" do
      delete :destroy, {:id => @feed.to_param}, valid_session
      response.should redirect_to(feeds_url)
    end

    it "redirect to root_url if current user" do
      sign_in_as FactoryGirl.create(:user)
      delete :destroy, {:id => @feed.to_param}, valid_session
      response.should redirect_to(root_url)
    end 
  end

end
