class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :title
      t.text :body
      t.text :crop_params
      t.string :file
      t.string :image

      t.timestamps
    end
  end
end
