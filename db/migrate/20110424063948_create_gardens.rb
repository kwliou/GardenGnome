class CreateGardens < ActiveRecord::Migration
  def self.up
    create_table :gardens do |t|
      t.string :name
      t.string :password
      t.boolean :public
      t.float :width
      t.float :height
      t.string :city
      t.string :state
      t.string :image_preview
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :gardens
  end
end
