class CreateNewsBlogs < ActiveRecord::Migration
  def change
    create_table :news_blogs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
