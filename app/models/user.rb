class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role
  has_secure_password
  validates_presence_of :password, :on => :create  
  validates_uniqueness_of :email
  
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
  
  
end
