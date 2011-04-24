class CreatePlants < ActiveRecord::Migration
  def self.up
    create_table :plants do |t|
      t.integer :plot_id
      t.string :name
      t.string :species
      t.string :online_entry
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :plants
  end
end
