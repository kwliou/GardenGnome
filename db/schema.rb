# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110503035139) do

  create_table "gardens", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.boolean  "is_public"
    t.float    "width"
    t.float    "height"
    t.string   "city"
    t.string   "state"
    t.string   "image_preview"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", :force => true do |t|
    t.integer  "plant_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "garden_id"
    t.integer  "plant_id"
    t.string   "title"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plants", :force => true do |t|
    t.integer  "plot_id"
    t.string   "name"
    t.string   "species"
    t.string   "online_entry"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plots", :force => true do |t|
    t.integer  "garden_id"
    t.string   "name"
    t.integer  "shapetype"
    t.integer  "color"
    t.float    "angle"
    t.string   "bounds"
    t.text     "points"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
