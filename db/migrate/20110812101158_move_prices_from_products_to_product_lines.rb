class MovePricesFromProductsToProductLines < ActiveRecord::Migration
  def up
    Price.delete_all
    rename_column :prices, :product_id, :product_variation_id
    remove_column :products, :price
    remove_column :products, :min_units
    remove_column :products, :quantity
  end

  def down
    rename_column :prices, :product_variation_id, :product_id
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
    add_column :products, :min_units, :integer
    add_column :products, :quantity, :integer
  end
end
