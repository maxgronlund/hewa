class RecreateImagesOnProducts < ActiveRecord::Migration
  def up
    Product.all.each do |product|
      product.image.recreate_versions! if product.image?
    end
  end

  def down
  end
end
