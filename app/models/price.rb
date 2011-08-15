class Price < ActiveRecord::Base
  belongs_to :product_variation

  validates :product_variation, :presence => true
  validates :price, :numericality => true

  #validates :quanity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1}

  scope :with_language_id, lambda { |language_id| where(:language_id => language_id) }

end
