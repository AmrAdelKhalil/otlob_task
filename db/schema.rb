# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171230225448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estates", force: :cascade do |t|
    t.string "street", null: false
    t.string "city", null: false
    t.string "zip", null: false
    t.string "state", null: false
    t.integer "beds", default: 1
    t.integer "baths", default: 1
    t.float "sq_ft", null: false
    t.string "estate_type", null: false
    t.date "sale_date"
    t.float "price", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
