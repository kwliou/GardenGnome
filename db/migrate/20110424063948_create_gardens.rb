class CreateGardens < ActiveRecord::Migration
  def self.up
    create_table :gardens do |t|
      t.string :name
      t.float :width
      t.float :height
      t.string :password
      t.boolean :public
      t.text :info
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :gardens
  end
end
