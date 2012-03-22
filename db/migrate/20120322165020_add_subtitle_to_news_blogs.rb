class AddSubtitleToNewsBlogs < ActiveRecord::Migration
  def change
    add_column :news_blogs, :sub_title, :text
  end
end
