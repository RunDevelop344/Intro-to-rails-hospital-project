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

ActiveRecord::Schema[8.1].define(version: 2026_03_22_025705) do
  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "hospital_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_departments_on_hospital_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "hospital_id", null: false
    t.string "name"
    t.string "specialty"
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.integer "hospital_id", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_reviews_on_hospital_id"
  end

  add_foreign_key "departments", "hospitals"
  add_foreign_key "doctors", "hospitals"
  add_foreign_key "reviews", "hospitals"
end
