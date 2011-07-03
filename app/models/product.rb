class Product < ActiveRecord::Base
  belongs_to :product_line
  
  validates_presence_of :title, :body
  attr_accessible :image, :image_cache, :remote_image_url, :remove_image, :title, :body
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
