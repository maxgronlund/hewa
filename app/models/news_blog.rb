class NewsBlog < ActiveRecord::Base
  default_scope order('created_at DESC')

  

  mount_uploader :newsletter, NewsletterUploader
  
  mount_uploader :image, NewsImageUploader
  attr_accessible :image, :image_cache, :remove_image, :image_size, :crop_params, :title, :body, :newsletter, :show_on_front, :sub_title
  serialize :crop_params, Hash
  include ImageCrop
  
  validates :title, :presence => true
  
  
#  scope :show_on_front, where(:show_on_front => true)
#  validates :newsletter, :presence => true

#  after_save :update_cover_img
#
#
#  private
#
#    def update_cover_img
#      system("convert -colorspace RGB -alpha off #{newsletter.path}[0] -resize 500x700! -background white -flatten -quality 90 #{newsletter.path.sub('.pdf', '.jpg')}")
#    end

end
