class Catalog < ActiveRecord::Base
  
  # content
  mount_uploader :file, CatalogUploader
  # image
  attr_accessible :image, :image_cache, :remove_image, :image_size
  serialize :crop_params, Hash
  mount_uploader :image, CatalogImageUploader
  include ImageCrop
  

  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
