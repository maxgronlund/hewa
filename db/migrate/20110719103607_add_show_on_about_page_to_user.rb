class AddShowOnAboutPageToUser < ActiveRecord::Migration
  def change
    add_column :users, :show_on_about_page, :boolean, :default => false
  end
end
