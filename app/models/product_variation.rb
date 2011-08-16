class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_many :prices, :dependent => :destroy

  #validates :title_suffix, :presence => true
  validates :item_nr, :presence => true
  validates :in_stock, :numericality => true

  def current_price
    @current_price ||= prices.with_language_id(1).last || NaN
  end

  def display_name
    "#{product.title}#{' - '+title_suffix if title_suffix.present?}"
  end

  def price=(params)
    @price_attributes = params
  end
  after_create :create_price


private
  def create_price
    self.prices.create @price_attributes if @price_attributes.present?
  end

end
