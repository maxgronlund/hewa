class ProductVariationsController < InheritedResources::Base
  
  belongs_to :product , :optional => true
  
end
