require 'spec_helper'

describe "product_variations/show.html.slim" do
  before(:each) do
    @product_variation = assign(:product_variation, stub_model(ProductVariation,
      :title_suffix => "Title Suffix",
      :item_nr => "Item Nr",
      :in_stock => 1,
      :on_sale => false,
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title Suffix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Item Nr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
