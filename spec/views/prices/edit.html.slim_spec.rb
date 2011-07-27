require 'spec_helper'

describe "prices/edit.html.slim" do
  before(:each) do
    @price = assign(:price, stub_model(Price,
      :product => nil,
      :language_id => 1,
      :price => "9.99",
      :quantity => 1
    ))
  end

  it "renders the edit price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prices_path(@price), :method => "post" do
      assert_select "input#price_product", :name => "price[product]"
      assert_select "input#price_language_id", :name => "price[language_id]"
      assert_select "input#price_price", :name => "price[price]"
      assert_select "input#price_quantity", :name => "price[quantity]"
    end
  end
end
