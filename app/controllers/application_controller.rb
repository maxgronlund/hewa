class ApplicationController < ActionController::Base
  protect_from_forgery  
  helper_method :current_user

  
  def get_site_info
    @welcome        = TextContent.welcome
    @footer_text    = TextContent.footer_text
  end
  

  rescue_from CanCan::AccessDenied do |exception|
      redirect_to no_access_index_path, :alert => exception.message
  end  

private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 

private  

#def current_user  
#  @current_user ||= User.find(session[:user_id]) if session[:user_id]  
#end  

end
