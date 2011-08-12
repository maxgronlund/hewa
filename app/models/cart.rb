class Cart < ActiveRecord::Base
  belongs_to :user

  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  attr_accessible :line_items_attributes
  
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    
    if current_item
      current_item.quantity += current_item.quantity
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  
end
