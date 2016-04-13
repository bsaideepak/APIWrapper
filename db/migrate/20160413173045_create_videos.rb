class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.timestamps null: false
      t.integer :video_id
      t.text :title
      t.text :event
      t.text :abstract
    end
  end
end
