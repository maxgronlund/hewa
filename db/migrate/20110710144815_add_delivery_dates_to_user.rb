class AddDeliveryDatesToUser < ActiveRecord::Migration
  def change
    add_column :users, :monday, :boolean, :default => true
    add_column :users, :tuesday, :boolean, :default => true
    add_column :users, :wednesday, :boolean, :default => true
    add_column :users, :thursday, :boolean, :default => true
    add_column :users, :friday, :boolean, :default => true
  end
end
