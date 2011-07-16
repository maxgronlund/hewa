class LineItemsController < InheritedResources::Base
  
  
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart,:notice => 'Line item was successfully created.') }
        format.xml { render :xml => @line_item,:status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @line_item.errors,:status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    go_to = session[:go_to_after_edit] || products_path
    session[:go_to_after_edit] = nil
    destroy!{go_to }
  end
  
end
