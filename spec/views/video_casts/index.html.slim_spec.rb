require 'spec_helper'

describe "video_casts/index.html.slim" do
  before(:each) do
    assign(:video_casts, [
      stub_model(VideoCast,
        :title => "Title",
        :body => "MyText",
        :mp4 => "Mp4",
        :m4v => "M4v",
        :webm => "Webm",
        :ogv => "Ogv"
      ),
      stub_model(VideoCast,
        :title => "Title",
        :body => "MyText",
        :mp4 => "Mp4",
        :m4v => "M4v",
        :webm => "Webm",
        :ogv => "Ogv"
      )
    ])
  end

  it "renders a list of video_casts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mp4".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "M4v".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Webm".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ogv".to_s, :count => 2
  end
end
