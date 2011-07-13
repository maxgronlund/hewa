class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.text :body
      t.string :video_url

      t.timestamps
    end
  end
end
