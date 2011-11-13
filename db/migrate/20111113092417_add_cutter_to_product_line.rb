class AddCutterToProductLine < ActiveRecord::Migration
  def up
   # remove_column :product_lines, :cutter
    add_column :product_lines, :cutter, :boolean
    
    ProductLine.all.each do |product_line|
      if product_line.id == 4
        product_line.cutter = true
      else
        product_line.cutter = false
      end
      product_line.save
    end
  end
  def down
    remove_column :product_lines, :cutter
  end
end
