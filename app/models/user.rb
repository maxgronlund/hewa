# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :role, :monday,:tuesday, :wednesday, :thursday, :friday

#  validates_presence_of :password, :on => :create  
#  validates_presence_of :name
#  validate :email, :presence => true, :uniqueness => true, :email_format => true
  validates_uniqueness_of :email
  validates_presence_of :email
 

  attr_accessible :image, :image_cache, :remote_image_url, :remove_image
  serialize :crop_params, Hash
  mount_uploader :image, AvatarUploader
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
    role == 'member' || role.nil? # Until role is set to :member by default
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
