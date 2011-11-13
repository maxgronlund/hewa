class AddCutterToProduct < ActiveRecord::Migration
  def up
   # remove_column :products, :cutter
    add_column :products, :cutter, :boolean
    
    ProductLine.all.each do |product_line|
      if product_line.id == 40
        product_line.cutter = true
      else
        product_line.cutter = false
      end
      product_line.save
    end
    
    
    Product.all.each do |product|
      if product.product_line_id == 40
        product.cutter = true
      else
        product.cutter = false
      end
      product.save
    end
    
  end
  def down
    remove_column :products, :cutter
  end
end
