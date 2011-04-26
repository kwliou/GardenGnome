class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.int :garden_id
      t.int :plant_id
      t.string :title
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
