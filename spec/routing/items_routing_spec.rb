require "spec_helper"

describe ItemsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/items").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/items/new").not_to be_routable
    end

    it "routes to #show" do
      get("/items/1").should route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/items/1/edit").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/items").not_to be_routable
    end

    it "routes to #update" do
      expect(:put => "/items/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/items/1").not_to be_routable
    end

  end
end
