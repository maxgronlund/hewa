require 'spec_helper'

describe "screen_casts/edit.html.slim" do
  before(:each) do
    @screen_cast = assign(:screen_cast, stub_model(ScreenCast,
      :title => "MyString",
      :body => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit screen_cast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => screen_casts_path(@screen_cast), :method => "post" do
      assert_select "input#screen_cast_title", :name => "screen_cast[title]"
      assert_select "textarea#screen_cast_body", :name => "screen_cast[body]"
      assert_select "input#screen_cast_url", :name => "screen_cast[url]"
    end
  end
end
