class LineItem < ActiveRecord::Base
  belongs_to :product_variation
  belongs_to :cart
  

  validates :quantity, :numericality => { :greater_than => 0 }

  def total_price
    quantity_price_lines.map { |quantity, price_quantity| price_quantity[0] * price_quantity[1] }.sum
  end
  
  def quantity_price_lines
    price_quantity_map = product_variation.prices.for_current_locale.inject({}) { |pq_map, price| pq_map.merge(price.quantity => [price.price, 0]) if quantity > 0 }

    remaining_quantity = quantity
    price_quantity_map.keys.reverse.map do |price_quantity|
      price_quantity_map[price_quantity][1] = price_quantity * (remaining_quantity / price_quantity).to_i
      remaining_quantity = remaining_quantity % price_quantity
    end

    price_quantity_map.select { |quantity, price_quantity| price_quantity[1] > 0 }
  end
  
end
