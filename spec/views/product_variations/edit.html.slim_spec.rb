require 'spec_helper'

describe "product_variations/edit.html.slim" do
  before(:each) do
    @product_variation = assign(:product_variation, stub_model(ProductVariation,
      :title_suffix => "MyString",
      :item_nr => "MyString",
      :in_stock => 1,
      :on_sale => false,
      :product => nil
    ))
  end

  it "renders the edit product_variation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_variations_path(@product_variation), :method => "post" do
      assert_select "input#product_variation_title_suffix", :name => "product_variation[title_suffix]"
      assert_select "input#product_variation_item_nr", :name => "product_variation[item_nr]"
      assert_select "input#product_variation_in_stock", :name => "product_variation[in_stock]"
      assert_select "input#product_variation_on_sale", :name => "product_variation[on_sale]"
      assert_select "input#product_variation_product", :name => "product_variation[product]"
    end
  end
end
