class HomeController < ApplicationController

  def index
    @menu = 'home'
    session[:go_to_after_edit] = root_path
    @promoted_product_lines = ProductLine.promote_on_front_page
    @news_blogs = NewsBlog.all
    @catalogs = Catalog.all
  end

end
