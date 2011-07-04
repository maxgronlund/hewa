class HomeController < ApplicationController
  
  before_filter :get_site_info
  
  def index
    session[:go_to_after_edit] = root_path
    @product_lines = ProductLine.all
  end

end
