class AddItemNrToProduct < ActiveRecord::Migration
  def change
    add_column :products, :item_nr, :string
  end
end
