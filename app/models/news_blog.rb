class NewsBlog < ActiveRecord::Base
  default_scope order('created_at DESC')

  mount_uploader :newsletter, NewsletterUploader

  validates :title, :presence => true
  validates :newsletter, :presence => true

  after_save :update_cover_img


  private

    def update_cover_img
      system("convert -colorspace RGB -alpha off #{newsletter.path}[0] -resize 500x700! -background white -flatten -quality 90 #{newsletter.path.sub('.pdf', '.jpg')}")
    end

end
