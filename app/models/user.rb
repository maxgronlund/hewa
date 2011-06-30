class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :role
  has_secure_password
  validates_presence_of :password, :on => :create  
  validates_presence_of :name
#  validate :email, :presence => true, :uniqueness => true, :email_format => true
  validates_uniqueness_of :email
  validates_presence_of :email

  attr_accessible :image, :image_cache, :remote_image_url, :remove_image
  mount_uploader :image, ImageUploader
  include ImageCrop
  
  ROLES = %w[member admin super]
  
  def admin_or_super?
    admin? || super?
  end
  
  def super?
    role == 'super'
  end
  
  def admin?
    role == 'admin'
  end
  
  def member?
    role == 'member'
  end
  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  def is_first_user?
    id == 1
  end
  
end
