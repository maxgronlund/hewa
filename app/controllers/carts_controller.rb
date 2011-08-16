class CartsController < InheritedResources::Base
  load_and_authorize_resource
  #before_filter :authenticate_user!, :only => [:checkout, :place_order]
  before_filter :load_current_cart, :except => :index
  
  def checkout
    @cart.delivery_address = nil if params[:new_delivery_address] == '1'
    @cart.invoice_address = nil if params[:new_invoice_address] == '1'
    @cart.ensure_user(current_user)
    @cart.update_attributes params[:cart]

    if params[:new_delivery_address] == '1' or params[:new_invoice_address] == '1'
      redirect_to checkout_cart_path(@cart)
    elsif is_place_order?
      @cart.place_order!

      # !!! TODO put email sending onto a background task queue
      OrderNotification.order_placed(@cart).deliver
      OrderNotification.order_placed_confirmation(@cart).deliver

      redirect_to place_order_confirmation_cart_path(@order)
    end
  end
  
  def place_order_confirmation
    remove_current_cart
  end
  
  def update
    update! { is_checkout?? checkout_cart_path(@cart) : params[:rurl] || cart_path(@cart) }
  end
  

protected

  def is_checkout?
    params[:commit] == I18n.t('cart.checkout_now')
  end

  def is_place_order?
    params[:commit] == I18n.t('cart.checkout.place_order')
  end

  def load_current_cart
    @cart = current_cart
  end

end
