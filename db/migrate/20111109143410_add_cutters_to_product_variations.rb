class AddCuttersToProductVariations < ActiveRecord::Migration
  def up
    add_column :product_variations, :cutter, :boolean
    
    ProductVariation.all.each do |product_variation|
      if product_variation.product.product_line.id == 4
        product_variation.cutter = true
      else
        product_variation.cutter = false
      end
      product_variation.save
    end
  end
  
  def down
    remove_column :product_variations, :cutter
  end
end
