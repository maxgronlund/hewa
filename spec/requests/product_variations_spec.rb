require 'spec_helper'

describe "ProductVariations" do
  describe "GET /product_variations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get product_variations_path
      response.status.should be(200)
    end
  end
end
