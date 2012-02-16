class UpdatePaymentMethod < ActiveRecord::Migration
  def up
    remove_column :carts, :pay_online
    add_column :carts, :pay_online, :string
  end

  def down
    remove_column :carts, :pay_online
    add_column :carts, :pay_online, :boolean
  end
end
