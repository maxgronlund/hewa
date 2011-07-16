require 'spec_helper'

describe "addresses/index.html.slim" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :send_to => "Send To",
        :street => "Street",
        :zip_code => "Zip Code",
        :city => "City",
        :user_country => "User Country",
        :user => nil
      ),
      stub_model(Address,
        :send_to => "Send To",
        :street => "Street",
        :zip_code => "Zip Code",
        :city => "City",
        :user_country => "User Country",
        :user => nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Send To".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
