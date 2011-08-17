require 'spec_helper'

describe "video_casts/edit.html.slim" do
  before(:each) do
    @video_cast = assign(:video_cast, stub_model(VideoCast,
      :title => "MyString",
      :body => "MyText",
      :mp4 => "MyString",
      :m4v => "MyString",
      :webm => "MyString",
      :ogv => "MyString"
    ))
  end

  it "renders the edit video_cast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => video_casts_path(@video_cast), :method => "post" do
      assert_select "input#video_cast_title", :name => "video_cast[title]"
      assert_select "textarea#video_cast_body", :name => "video_cast[body]"
      assert_select "input#video_cast_mp4", :name => "video_cast[mp4]"
      assert_select "input#video_cast_m4v", :name => "video_cast[m4v]"
      assert_select "input#video_cast_webm", :name => "video_cast[webm]"
      assert_select "input#video_cast_ogv", :name => "video_cast[ogv]"
    end
  end
end
