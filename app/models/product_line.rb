class ProductLine < ActiveRecord::Base
  has_many :products

  validates_presence_of :title, :body
  attr_accessible :image, :image_cache, :remote_image_url, :remove_image, :title, :body, :c5_desc, :promote_on_front_page, :show_in_menu

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
  
  scope :promote_on_front_page, where("promote_on_front_page != ?", false) 
  scope :show_in_menu, where("show_in_menu != ?", false) 


end
