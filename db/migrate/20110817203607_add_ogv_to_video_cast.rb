class AddOgvToVideoCast < ActiveRecord::Migration
  def change
    add_column :video_casts, :ogv, :string
  end
end
