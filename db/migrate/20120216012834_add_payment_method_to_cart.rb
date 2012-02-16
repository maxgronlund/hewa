class AddPaymentMethodToCart < ActiveRecord::Migration
  def change
    add_column :carts, :pay_online, :boolean
  end
end
