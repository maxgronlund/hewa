require "spec_helper"

describe ScreenCastsController do
  describe "routing" do

    it "routes to #index" do
      get("/screen_casts").should route_to("screen_casts#index")
    end

    it "routes to #new" do
      get("/screen_casts/new").should route_to("screen_casts#new")
    end

    it "routes to #show" do
      get("/screen_casts/1").should route_to("screen_casts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/screen_casts/1/edit").should route_to("screen_casts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/screen_casts").should route_to("screen_casts#create")
    end

    it "routes to #update" do
      put("/screen_casts/1").should route_to("screen_casts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/screen_casts/1").should route_to("screen_casts#destroy", :id => "1")
    end

  end
end
