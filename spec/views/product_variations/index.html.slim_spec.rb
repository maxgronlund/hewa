require 'spec_helper'

describe "product_variations/index.html.slim" do
  before(:each) do
    assign(:product_variations, [
      stub_model(ProductVariation,
        :title_suffix => "Title Suffix",
        :item_nr => "Item Nr",
        :in_stock => 1,
        :on_sale => false,
        :product => nil
      ),
      stub_model(ProductVariation,
        :title_suffix => "Title Suffix",
        :item_nr => "Item Nr",
        :in_stock => 1,
        :on_sale => false,
        :product => nil
      )
    ])
  end

  it "renders a list of product_variations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title Suffix".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Item Nr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
