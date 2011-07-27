class AboutController < ApplicationController
  def index
    @menu = 'about'
    @users = User.show_on_about_page
    @about_text    = TextContent.about_text
  end

end
