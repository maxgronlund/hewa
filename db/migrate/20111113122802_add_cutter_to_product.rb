class AddCutterToProduct < ActiveRecord::Migration
  def up
   # remove_column :products, :cutter
    add_column :products, :cutter, :boolean
    
    Product.all.each do |product|
      if product.product_line_id == 4
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
