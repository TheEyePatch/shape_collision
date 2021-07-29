# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_29_090842) do

  create_table "dimensions", force: :cascade do |t|
    t.integer "rectangle_id"
    t.float "height"
    t.float "width"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rectangle_id"], name: "index_dimensions_on_rectangle_id"
  end

  create_table "rads", force: :cascade do |t|
    t.integer "circle_id"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["circle_id"], name: "index_rads_on_circle_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.string "type"
    t.float "x"
    t.float "y"
    t.float "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
