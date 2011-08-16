class ProductVariationsController < InheritedResources::Base
  load_and_authorize_resource
  
  belongs_to :product , :optional => true
  
  def update
    update! { product_line_product_path(@product_variation.product.product_line, @product_variation.product) }
  end

  def add_to_cart
    product_variation = ProductVariation.find(params[:id])
    @line_item = current_cart.add_product_variation(product_variation)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, :notice => 'Line item was successfully created.') }
        format.xml { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render product_variation.product }
        format.xml { render :xml => @line_item.errors,:status => :unprocessable_entity }
      end
    end
  end

end
