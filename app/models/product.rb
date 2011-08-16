class Product < ActiveRecord::Base
  belongs_to :product_line
  has_many :line_items
  has_many :product_variations
  
  before_destroy :ensure_not_referenced_by_any_line_item
  validates_presence_of :title
  validates_presence_of :body
  attr_accessible :title, :body, :product_line_id, :product_variation
  
  serialize :crop_params, Hash
  mount_uploader :image, ProductImageUploader
  attr_accessible :image, :image_cache, :remote_image_url, :remove_image
  include ImageCrop
  
  def self.search(search)
     if search
       where('title LIKE ?', "%#{search}%")
     else
       scoped
     end
   end

   def product_variation=(params)
     @product_variation_attributes = params
   end
   after_create :create_product_variation
   
private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  def create_product_variation
    self.product_variations.create @product_variation_attributes if @product_variation_attributes.present?
  end
   
end
