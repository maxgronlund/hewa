class CreateScreenCasts < ActiveRecord::Migration
  def change
    create_table :screen_casts do |t|
      t.string :title
      t.text :body
      t.string :url

      t.timestamps
    end
  end
end
