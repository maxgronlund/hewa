require 'spec_helper'

describe "news_blogs/show.html.slim" do
  before(:each) do
    @news_blog = assign(:news_blog, stub_model(NewsBlog,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
