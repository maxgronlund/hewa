class CopyProductsToProductVariations < ActiveRecord::Migration
  def up
    create_table :product_variations do |t|
      t.string :title_suffix
      t.string :item_nr
      t.integer :in_stock
      t.boolean :on_sale
      t.belongs_to :product

      t.timestamps
    end
    add_index :product_variations, :product_id
    
    @products = Product.all
    @products.each do |product|
      @product_variation = ProductVariation.new()
      
      @product_variation.title_suffix = product.title
      @product_variation.item_nr      = product.item_nr
      @product_variation.product_id   = product.id
      @product_variation.in_stock     = 10000
      @product_variation.on_sale      = true
      
      @product_variation.save
    end
  end

  def down
    drop_table :product_variations
  end
end
