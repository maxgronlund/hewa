require 'spec_helper'

describe "screen_casts/index.html.slim" do
  before(:each) do
    assign(:screen_casts, [
      stub_model(ScreenCast,
        :title => "Title",
        :body => "MyText",
        :url => "Url"
      ),
      stub_model(ScreenCast,
        :title => "Title",
        :body => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of screen_casts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
