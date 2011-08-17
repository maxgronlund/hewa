class ProductVariationsController < InheritedResources::Base
  load_and_authorize_resource
  
  helper :carts
  belongs_to :product , :optional => true
  
  def create
    update! { product_line_product_path(@product_variation.product.product_line, @product_variation.product) }
  end
  
  def update
    update! { product_line_product_path(@product_variation.product.product_line, @product_variation.product) }
  end

  def add_to_cart
    product_variation = ProductVariation.find(params[:id])
    quantity = params[:quantity].to_i
    quantity = 1 if quantity <= 0
    @line_item = current_cart.add_product_variation(product_variation, quantity)

    respond_to do |format|
      if @line_item.save
        #format.html { redirect_to(@line_item.cart, :notice => 'Line item was successfully created.') }
        format.html do
          flash[:notice] = I18n.t('product_variation.added_to_cart', :product => product_variation.title_suffix)
          redirect_to product_line_product_path(product_variation.product.product_line, product_variation.product)
        end
        format.xml { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { redirect_to product_line_product_path(product_variation.product.product_line, product_variation.product) }
        format.xml { render :xml => @line_item.errors,:status => :unprocessable_entity }
      end
    end
  end

end
