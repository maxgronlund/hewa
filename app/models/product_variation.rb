class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_many :prices, :dependent => :destroy


  def current_price
    @current_price ||= prices.with_language_id(1).last || NaN
  end

  def display_name
    "#{product.title} - #{title_suffix}"
  end

end
