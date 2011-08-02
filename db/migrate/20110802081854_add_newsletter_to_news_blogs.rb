class AddNewsletterToNewsBlogs < ActiveRecord::Migration
  def change
    add_column :news_blogs, :newsletter, :string
  end
end
