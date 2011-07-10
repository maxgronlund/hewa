class ApplicationController < ActionController::Base
  protect_from_forgery  


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to no_access_index_path, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
    if current_user.admin_or_super?
      admin_index_path
    else
      user_path(resource)
    end
  end
  
  
private  

#def current_user  
#  @current_user ||= User.find(session[:user_id]) if session[:user_id]  
#end  
  
#  helper_method :current_user
end
