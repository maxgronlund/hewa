class ApplicationController < ActionController::Base
  protect_from_forgery 
  @menu_selected = 'da da' 
  
  helper_method :current_menu
  
  


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
  
  def current_menu=(menu_item)
    @menu_selected = menu_item
  end
  
  def current_menu
    @menu_selected
  end
  

end
