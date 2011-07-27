class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :product
      t.integer :language_id, :default => 1
      t.decimal :price, :precision => 8, :scale => 2 
      t.integer :quantity, :default => 1
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :prices, :product_id
  end
end
