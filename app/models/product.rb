class Product < ActiveRecord::Base
  belongs_to :product_line
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates_presence_of :title, :item_nr
  attr_accessible :image, :image_cache, :item_nr, :min_units, :price, :remote_image_url, :remove_image, :title, :body
  
  serialize :crop_params, Hash
  mount_uploader :image, ProductImageUploader
  include ImageCrop
  
  def self.search(search)
     if search
       where('title LIKE ?', "%#{search}%")
     else
       scoped
     end
   end
   
   
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
   
end
