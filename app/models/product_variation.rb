class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  has_many :prices, :dependent => :destroy

  #validates :title_suffix, :presence => true
  validates :item_nr, :presence => true
#  validates :in_stock, :numericality => true

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

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
