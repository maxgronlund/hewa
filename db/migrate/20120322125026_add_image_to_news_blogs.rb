class AddImageToNewsBlogs < ActiveRecord::Migration
  def change
    add_column :news_blogs, :image, :string
    add_column :news_blogs, :crop_params, :text
    add_column :news_blogs, :show_on_front, :boolean
  end
end
