require 'spec_helper'

describe "screen_casts/show.html.slim" do
  before(:each) do
    @screen_cast = assign(:screen_cast, stub_model(ScreenCast,
      :title => "Title",
      :body => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
