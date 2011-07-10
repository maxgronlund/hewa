class ApplicationController < ActionController::Base
  protect_from_forgery  
#  helper_method :current_user
  before_filter :get_site_info

  
  def get_site_info
    @welcome        = TextContent.welcome
    @footer_text    = TextContent.footer_text
  end
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to no_access_index_path, :alert => exception.message
  end  
 
private 
  def after_sign_in_path_for(resource)
    if current_user.admin_or_super?
      admin_index_path
    else
      user_path(resource)
    end
  end
  

private  


end
