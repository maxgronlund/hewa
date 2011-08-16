require "spec_helper"

describe VideoCastsController do
  describe "routing" do

    it "routes to #index" do
      get("/video_casts").should route_to("video_casts#index")
    end

    it "routes to #new" do
      get("/video_casts/new").should route_to("video_casts#new")
    end

    it "routes to #show" do
      get("/video_casts/1").should route_to("video_casts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/video_casts/1/edit").should route_to("video_casts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/video_casts").should route_to("video_casts#create")
    end

    it "routes to #update" do
      put("/video_casts/1").should route_to("video_casts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/video_casts/1").should route_to("video_casts#destroy", :id => "1")
    end

  end
end
