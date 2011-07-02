class AddImageToProductLine < ActiveRecord::Migration
  def change
    add_column :product_lines, :image, :string
  end
end
