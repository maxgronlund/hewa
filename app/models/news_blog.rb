class NewsBlog < ActiveRecord::Base
  default_scope order('created_at DESC')

  mount_uploader :newsletter, NewsletterUploader

  validate :title, :presence => true
  validate :newsletter, :presence => true
end
