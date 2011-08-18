class Price < ActiveRecord::Base
  default_scope order('quantity')
  belongs_to :product_variation

  validates :product_variation, :presence => true
  validates :language_id, :presence => true
  validates :price, :numericality => true
  validates :quantity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1}

  scope :with_language_id, lambda { |language_id| where(:language_id => language_id) }

  def self.for_current_locale
    with_language_id(Language.id_from_locale)
  end

end
