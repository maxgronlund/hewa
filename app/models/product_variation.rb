class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  has_many :prices, :dependent => :destroy
  accepts_nested_attributes_for :prices, :allow_destroy => true
  attr_accessible :prices_attributes

  #validates :title_suffix, :presence => true
  validates :item_nr, :presence => true
#  validates :in_stock, :numericality => true

  attr_accessible :product_id, :title_suffix, :item_nr, :in_stock, :on_sale

  def display_name
    if "#{product.title}" ==  "#{title_suffix}"
      "#{product.title}"
    else
      "#{product.title}#{' - '+title_suffix if title_suffix.present?}"
    end
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
