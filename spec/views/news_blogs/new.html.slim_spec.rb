require 'spec_helper'

describe "news_blogs/new.html.slim" do
  before(:each) do
    assign(:news_blog, stub_model(NewsBlog,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new news_blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_blogs_path, :method => "post" do
      assert_select "input#news_blog_title", :name => "news_blog[title]"
      assert_select "textarea#news_blog_body", :name => "news_blog[body]"
    end
  end
end
