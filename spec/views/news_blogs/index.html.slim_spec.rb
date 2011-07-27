require 'spec_helper'

describe "news_blogs/index.html.slim" do
  before(:each) do
    assign(:news_blogs, [
      stub_model(NewsBlog,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(NewsBlog,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of news_blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end