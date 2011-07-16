require 'spec_helper'

describe "addresses/edit.html.slim" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :send_to => "MyString",
      :street => "MyString",
      :zip_code => "MyString",
      :city => "MyString",
      :user_country => "MyString",
      :user => nil
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path(@address), :method => "post" do
      assert_select "input#address_send_to", :name => "address[send_to]"
      assert_select "input#address_street", :name => "address[street]"
      assert_select "input#address_zip_code", :name => "address[zip_code]"
      assert_select "input#address_city", :name => "address[city]"
      assert_select "input#address_user_country", :name => "address[user_country]"
      assert_select "input#address_user", :name => "address[user]"
    end
  end
end
