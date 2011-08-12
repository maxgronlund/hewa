class AddStateToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :state, :string
  end
end
