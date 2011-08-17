require 'spec_helper'

describe "video_casts/new.html.slim" do
  before(:each) do
    assign(:video_cast, stub_model(VideoCast,
      :title => "MyString",
      :body => "MyText",
      :mp4 => "MyString",
      :m4v => "MyString",
      :webm => "MyString",
      :ogv => "MyString"
    ).as_new_record)
  end

  it "renders new video_cast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => video_casts_path, :method => "post" do
      assert_select "input#video_cast_title", :name => "video_cast[title]"
      assert_select "textarea#video_cast_body", :name => "video_cast[body]"
      assert_select "input#video_cast_mp4", :name => "video_cast[mp4]"
      assert_select "input#video_cast_m4v", :name => "video_cast[m4v]"
      assert_select "input#video_cast_webm", :name => "video_cast[webm]"
      assert_select "input#video_cast_ogv", :name => "video_cast[ogv]"
    end
  end
end
