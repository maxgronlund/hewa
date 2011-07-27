class AddC5DescToProductLines < ActiveRecord::Migration
  def change
    add_column :product_lines, :c5_desc, :string
  end
end
