class ProductVariationsController < InheritedResources::Base
  
  belongs_to :product , :optional => true
  
  
  def update
    update! { product_line_product_path(@product_variation.product.product_line, @product_variation.product) }
  end
end
