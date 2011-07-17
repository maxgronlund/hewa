class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  before_filter :get_site_info

  #!!! do i have to featch all this all the time?
  def get_site_info
    @menu = 'home'
    @show_grid = grid_is_on?
  end


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

  
  def grid_is_on?
    Rails.env == 'development' && (user_signed_in? && current_user.grid?)
  end
  

end
