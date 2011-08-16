class VideoCast < ActiveRecord::Base
  
  mount_uploader :mp4, Mp4Uploader
  mount_uploader :m4v, M4vUploader

  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  
  
  def self.with_identity(identity)
    where(:identity => identity).first
  end
  
end
