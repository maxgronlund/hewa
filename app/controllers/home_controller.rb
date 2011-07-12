class HomeController < ApplicationController
  
  def index
    current_menu = 'byge mand bob'
    session[:go_to_after_edit] = root_path
    @welcome = TextContent.welcome
  end

end
