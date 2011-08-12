class MoveLineItemToProductVariation < ActiveRecord::Migration
  def up
    LineItem.delete_all
    rename_column :line_items, :product_id, :product_variation_id
  end

  def down
    rename_column :line_items, :product_variation_id, :product_id
  end
end
