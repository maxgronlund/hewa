class AddCvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cv, :text
  end
end
