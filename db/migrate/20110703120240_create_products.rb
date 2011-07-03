class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :crop_params, :limit => 1024
      t.belongs_to :product_line

      t.timestamps
    end
    add_index :products, :product_line_id
  end
end
