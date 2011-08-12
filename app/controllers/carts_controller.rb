class CartsController < InheritedResources::Base

  before_filter :authenticate_user!, :only => [:checkout, :place_order]
  
  # GET /carts/1
  # GET /carts/1.xml
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to products_path, :notice => 'Invalid cart'
    else
      session[:go_to_after_edit] = @cart
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @cart }
      end
    end
  end
  
  def checkout
    @cart = Cart.find(params[:id])

    # ensure user cannot confirm other users' carts
    redirect_to no_access_index_path and return if (@cart.user_id.present? && @cart.user_id != current_user.id)

    @cart.delivery_address = nil if params[:new_delivery_address] == '1'
    @cart.invoice_address = nil if params[:new_invoice_address] == '1'
    @cart.ensure_user(current_user)
    @cart.update_attributes params[:cart]

    if params[:new_delivery_address] == '1' or params[:new_invoice_address] == '1'
      redirect_to checkout_cart_path(@cart)
    elsif is_place_order?
      @cart.place_order!
      redirect_to place_order_confirmation_cart_path(@order)
    end
  end
  
  def place_order_confirmation
    @cart = curent_user.carts.find(params[:id])
  end
  
  def update
    update! { is_checkout?? checkout_cart_path(@cart) : params[:rurl] || cart_path(@cart) }
  end
  
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(products_path, :notice => 'Your cart is currently empty') }
      format.xml { head :ok }
    end
  end


protected

  def is_checkout?
    params[:commit] == 'Checkout Now'
  end

  def is_place_order?
    params[:commit] == 'Place Order'
  end

end
