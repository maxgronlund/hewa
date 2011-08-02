class NewsBlogsController < InheritedResources::Base

  def index
    @menu = 'news_blogs'
    index!
  end

  def create
    create! { news_blogs_path }
  end

  def update
    update! { news_blogs_path }
  end

end
