require 'spec_helper'

describe "helps/index.html.slim" do
  before(:each) do
    assign(:helps, [
      stub_model(Help,
        :title => "Title",
        :body => "MyText",
        :video_url => "Video Url"
      ),
      stub_model(Help,
        :title => "Title",
        :body => "MyText",
        :video_url => "Video Url"
      )
    ])
  end

  it "renders a list of helps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Video Url".to_s, :count => 2
  end
end
