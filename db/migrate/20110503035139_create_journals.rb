class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.integer :plant_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :journals
  end
end
