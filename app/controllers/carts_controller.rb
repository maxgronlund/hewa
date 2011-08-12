class CartsController < InheritedResources::Base

  before_filter :authenticate_user!, :only => [:checkout]
  
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
    @cart.user = current_user
  end
  
  def update
    update! { is_checkout?? checkout_cart_path(@cart) : cart_path(@cart) }
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

end
