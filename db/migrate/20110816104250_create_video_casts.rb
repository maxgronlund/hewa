class CreateVideoCasts < ActiveRecord::Migration
  def change
    create_table :video_casts do |t|
      t.string :title
      t.text :body
      t.string :mp4
      t.string :m4v


      t.timestamps
    end
  end
end
