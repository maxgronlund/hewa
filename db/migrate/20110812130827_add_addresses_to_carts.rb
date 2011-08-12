class AddAddressesToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :delivery_address_id, :integer
    add_column :carts, :invoice_address_id, :integer
  end
end
