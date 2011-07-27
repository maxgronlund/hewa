require 'spec_helper'

describe "prices/index.html.slim" do
  before(:each) do
    assign(:prices, [
      stub_model(Price,
        :product => nil,
        :language_id => 1,
        :price => "9.99",
        :quantity => 1
      ),
      stub_model(Price,
        :product => nil,
        :language_id => 1,
        :price => "9.99",
        :quantity => 1
      )
    ])
  end

  it "renders a list of prices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
