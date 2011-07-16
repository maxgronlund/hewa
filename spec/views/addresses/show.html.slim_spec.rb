require 'spec_helper'

describe "addresses/show.html.slim" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :send_to => "Send To",
      :street => "Street",
      :zip_code => "Zip Code",
      :city => "City",
      :user_country => "User Country",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Send To/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Country/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
