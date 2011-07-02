class ProductLine < ActiveRecord::Base
  validates_presence_of :title, :body
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
