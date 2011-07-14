class Product < ActiveRecord::Base
  belongs_to :product_line
  
  validates_presence_of :title, :body, :price, :item_nr
  attr_accessible :image, :image_cache, :item_nr, :price, :remote_image_url, :remove_image, :title, :body
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
end
