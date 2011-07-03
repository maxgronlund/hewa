class HomeController < ApplicationController
  
  def index
    session[:go_to_after_edit] = root_path
    @welcome = TextContent.welcome
    @product_lines = ProductLine.all
  end

end
