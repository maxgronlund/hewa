require "spec_helper"

describe NewsBlogsController do
  describe "routing" do

    it "routes to #index" do
      get("/news_blogs").should route_to("news_blogs#index")
    end

    it "routes to #new" do
      get("/news_blogs/new").should route_to("news_blogs#new")
    end

    it "routes to #show" do
      get("/news_blogs/1").should route_to("news_blogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/news_blogs/1/edit").should route_to("news_blogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/news_blogs").should route_to("news_blogs#create")
    end

    it "routes to #update" do
      put("/news_blogs/1").should route_to("news_blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/news_blogs/1").should route_to("news_blogs#destroy", :id => "1")
    end

  end
end
