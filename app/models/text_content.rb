class TextContent < ActiveRecord::Base
  validates :identity, :presence => true, :uniqueness => true
  validates_presence_of :title, :identity
  
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

  def self.welcome 
    with_identity('welcome')
  end
  
  def self.footer_text
    with_identity('footer_text')
  end
  
  def self.about_text
    with_identity('about_text')
  end
  
end
