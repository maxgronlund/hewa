require 'spec_helper'

describe "video_casts/show.html.slim" do
  before(:each) do
    @video_cast = assign(:video_cast, stub_model(VideoCast,
      :title => "Title",
      :body => "MyText",
      :mp4 => "Mp4",
      :m4v => "M4v",
      :webm => "Webm",
      :ogv => "Ogv"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mp4/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/M4v/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Webm/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ogv/)
  end
end
