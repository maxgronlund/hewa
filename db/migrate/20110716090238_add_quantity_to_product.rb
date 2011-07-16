class AddQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :quantity, :integer, :default => 1
  end
end
