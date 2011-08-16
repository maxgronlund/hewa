class RemoveItemNrFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :item_nr
  end

  def down
    add_column :products, :item_nr, :integer
  end
end
