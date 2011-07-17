class ApplicationController < ActionController::Base

  protect_from_forgery  
#  helper_method :current_user
  before_filter :get_site_info


  #!!! do i have to featch all this all the time?
  def get_site_info
    @welcome        = TextContent.welcome
    @footer_text    = TextContent.footer_text
    @menu = 'home'
    @product_lines  = ProductLine.order('title asc')
    @show_grid = grid_is_on?
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
  
  def grid_is_on?
    Rails.env == 'development' && (user_signed_in? && current_user.grid?)
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end













