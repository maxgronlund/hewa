require "spec_helper"

describe ProductVariationsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_variations").should route_to("product_variations#index")
    end

    it "routes to #new" do
      get("/product_variations/new").should route_to("product_variations#new")
    end

    it "routes to #show" do
      get("/product_variations/1").should route_to("product_variations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_variations/1/edit").should route_to("product_variations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_variations").should route_to("product_variations#create")
    end

    it "routes to #update" do
      put("/product_variations/1").should route_to("product_variations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_variations/1").should route_to("product_variations#destroy", :id => "1")
    end

  end
end
