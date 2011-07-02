class ProductLine < ActiveRecord::Base
  validates_presence_of :title, :body
  
  attr_accessible :image, :image_cache, :remote_image_url, :remove_image
  serialize :crop_params, Hash
  mount_uploader :image, ProductLineImageUploader
  include ImageCrop
  
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
