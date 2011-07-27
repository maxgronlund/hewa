class AddPromoteOnFrontPageToProductLines < ActiveRecord::Migration
  def change
    add_column :product_lines, :promote_on_front_page, :boolean, :default => true
  end
end
