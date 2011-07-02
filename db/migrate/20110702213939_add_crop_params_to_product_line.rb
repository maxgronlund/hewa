class AddCropParamsToProductLine < ActiveRecord::Migration
  def change
    add_column :product_lines, :crop_params, :string, :limit => 256
  end
end
