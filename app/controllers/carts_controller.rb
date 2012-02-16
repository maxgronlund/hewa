class CartsController < InheritedResources::Base
  load_and_authorize_resource
  #before_filter :authenticate_user!, :only => [:checkout, :place_order]
  before_filter :load_current_cart, :except => [:index, :order_confirmation]
  
  def current
    render 'show'
  end
  
  def checkout
    @cart.delivery_address = nil if params[:new_delivery_address] == '1'
    @cart.invoice_address = nil if params[:new_invoice_address] == '1'
    @cart.ensure_user(current_user)
    @cart.update_attributes params[:cart]
   # @cart.pay_online = params[:pay_online]

    if params[:new_delivery_address] == '1' or params[:new_invoice_address] == '1'
      redirect_to checkout_carts_path
    elsif is_place_order?
      redirect_to place_order_carts_path
    end
  end
  
  def place_order
    @cart = current_cart

    @cart.place_order!
    remove_current_cart

    # !!! TODO put email sending onto a background task queue
    OrderNotification.order_placed(@cart).deliver
    OrderNotification.order_placed_confirmation(@cart).deliver

    redirect_to order_confirmation_cart_path(@cart)
  end

  def order_confirmation
    @cart = current_user.carts.find(params[:id])
  end
  
  def update
    update! { is_checkout?? checkout_cart_path(@cart) : params[:rurl] || cart_path(@cart) }
  end
  
  def destroy
    destroy! { root_path }
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
