require "spec_helper"

describe ReadItemsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/read_items").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/read_items/new").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/read_items/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/read_items/1/edit").not_to be_routable
    end

    it "routes to #create" do
      post("/read_items").should route_to("read_items#create")
    end

    it "routes to #update" do
      expect(:put => "/read_items/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/read_items/1").not_to be_routable
    end

  end
end
