class LineItem < ActiveRecord::Base
  belongs_to :product_variation
  belongs_to :cart
  

  validates :quantity, :numericality => { :greater_than => 0 }

  def price
    product_variation.current_price.price
  end
  
  def total_price
    price * quantity
  end
  
end
