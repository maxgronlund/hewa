class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :send_to
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :user_country
      t.belongs_to :user

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
