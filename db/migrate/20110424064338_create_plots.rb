class CreatePlots < ActiveRecord::Migration
  def self.up
    create_table :plots do |t|
      t.integer :garden_id
      t.string :name
      t.integer :shapetype
      t.integer :color
      t.float :angle
      t.string :bounds
      t.text :points
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :plots
  end
end
