class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :garden_id
      t.integer :plant_id
      t.string :title
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
