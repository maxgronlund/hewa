class AddShowInMenuToProductLines < ActiveRecord::Migration
  def change
    add_column :product_lines, :show_in_menu, :boolean, :default => true
  end
end
