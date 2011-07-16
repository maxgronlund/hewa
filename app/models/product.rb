class Product < ActiveRecord::Base
  belongs_to :product_line
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates_presence_of :title, :body, :item_nr,:price
  attr_accessible :image, :image_cache, :item_nr, :min_units, :price, :remote_image_url, :remove_image, :title, :body
  
  validates :price, :numericality => true
  validates :min_units, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0.01}
            
#  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
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
