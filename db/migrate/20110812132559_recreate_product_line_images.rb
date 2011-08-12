class RecreateProductLineImages < ActiveRecord::Migration
  def up
    
    ProductLine.all.each do |product_line| 
      product_line.image.recreate_versions! if product_line.image.present?
    end
    
    
  end

  def down
  end
end
