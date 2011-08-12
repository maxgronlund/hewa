class AddImageSizeToProductLines < ActiveRecord::Migration
  def up
    add_column :product_lines, :image_size, :string
    
    @product_lines = ProductLine.all
    @product_lines.each do |product_line|
      product_line.image_size = 'normal'
      product_line.save
    end
      
      
  end
  
  def down
    remove_column :product_lines, :image_size
  end
end
