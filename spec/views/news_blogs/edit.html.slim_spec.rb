require 'spec_helper'

describe "news_blogs/edit.html.slim" do
  before(:each) do
    @news_blog = assign(:news_blog, stub_model(NewsBlog,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit news_blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_blogs_path(@news_blog), :method => "post" do
      assert_select "input#news_blog_title", :name => "news_blog[title]"
      assert_select "textarea#news_blog_body", :name => "news_blog[body]"
    end
  end
end
