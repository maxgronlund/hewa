class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :delivery_address, :class_name => 'Address'
  belongs_to :invoice_address, :class_name => 'Address'

  attr_accessible :delivery_address_id, :invoice_address_id

  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  attr_accessible :line_items_attributes
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    
    if current_item
      current_item.quantity += current_item.quantity
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def ensure_user(user)
    self.user ||= user
    self.delivery_address ||= user.addresses.last
    self.invoice_address ||= user.addresses.last
  end


  # Cart/Order workflow:
  # Customer creates/edits order (adds items to cart, changes quantities)
  #   => order open
  # Customer place order (select delivery and invoice addresses)
  #   => order placed
  #   => email sent to Customer and Hewa
  # Hewa confirms order
  #   => order confirmed
  #   => email sent to Customer
  scope :order_open, where(:state => nil)
  scope :order_placed, where(:state => 'placed')
  scope :order_confirmed, where(:state => 'confirmed')
  
  def place_order!
    update_attribute :state, 'placed'
  end

  def confirm_order!
    update_attribute :state, 'confirmed'
  end

end
