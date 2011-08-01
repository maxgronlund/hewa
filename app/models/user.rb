class User < ActiveRecord::Base
  has_many :addresses
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :grid, :password, :password_confirmation, :remember_me,:show_on_about_page,
                  :name, :role, :monday,:tuesday, :wednesday, :thursday, :friday,:cv
                  
                  
  validate :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
            

  # Avatar image
  attr_accessible :image, :image_cache, :remote_image_url, :remove_image
  serialize :crop_params, Hash
  mount_uploader :image, AvatarUploader
  include ImageCrop
  



  # validate :name, :presence => true
  
  ROLES = %w[customer member admin super]
  
  def admin_or_super?
    admin? || super?
  end
  
  def super?
    role == 'super'
  end
  
  def admin?
    role == 'admin'
  end
  
  def customer?
    role == 'customer' || role.nil? # Until role is set to :customer by default
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
  
  scope :show_on_about_page, where("show_on_about_page != ?", false) 


end
