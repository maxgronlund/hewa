class HomeController < ApplicationController

  def index
    @menu = 'home'
    session[:go_to_after_edit] = root_path
    @product_lines = ProductLine.all
    @news_blogs = NewsBlog.all
  end

end
