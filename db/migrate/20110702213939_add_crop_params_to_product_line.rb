class AddCropParamsToProductLine < ActiveRecord::Migration
  def change
    add_column :product_lines, :crop_params, :string, :limit => 1024
  end
end
