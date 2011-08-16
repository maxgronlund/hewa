class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  before_filter :get_site_info
  before_filter :set_locale

  #!!! do i have to featch all this all the time?
  def get_site_info
    @welcome        = TextContent.welcome
    @footer_text    = TextContent.footer_text
    @menu = 'home'
#    @product_lines  = ProductLine.order('title asc')
    @product_lines = ProductLine.show_in_menu.order('title asc')


  end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to no_access_index_path, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
    if current_user.admin_or_super?
      admin_index_path
    else
      resource.profile_incomplete?? user_path(resource) : root_path
    end
  end


  def has_cart?
    #session[:cart_id].present? && Cart.exists?(session[:cart_id])
    user_signed_in? && current_user.carts.order_open.any? # user sign in is required anyway
  end

  def current_cart
    return user_current_cart
  #  Cart.find(session[:cart_id])
  #rescue ActiveRecord::RecordNotFound
  #  cart = current_user.carts.create # customer is always logged in so instead we could use: current_user.carts.create
  #  session[:cart_id] = cart.id
  #  cart
  end
  helper_method :has_cart?, :current_cart

  def remove_current_cart
    session.delete(:cart_id)
  end

  def user_current_cart
    if user_signed_in? && current_user.carts.order_open.any?
      current_user.carts.order_open.last
    else
      current_user.carts.create
    end
  end

protected
  def set_locale
    I18n.locale = :da
  end

end
