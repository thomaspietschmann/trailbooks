# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_112541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "host_email"
    t.string "category"
    t.boolean "toilets"
    t.boolean "showers"
    t.boolean "lunch_bag"
    t.boolean "breakfast"
    t.boolean "dinner"
    t.float "longitutde"
    t.float "latitude"
    t.float "price_per_night"
    t.integer "capacity"
    t.bigint "trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_accomodations_on_trail_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trail_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_itineraries_on_trail_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "accomodation_id", null: false
    t.date "checkin_date"
    t.float "total_price"
    t.boolean "booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accomodation_id"], name: "index_reservations_on_accomodation_id"
    t.index ["itinerary_id"], name: "index_reservations_on_itinerary_id"
  end

  create_table "trail_stages", force: :cascade do |t|
    t.bigint "trail_id"
    t.string "name"
    t.integer "stage_number"
    t.float "longitude"
    t.float "latitude"
    t.integer "distance_from_last"
    t.integer "ascend_from_last"
    t.integer "descend_from_last"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_trail_stages_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.integer "distance"
    t.integer "number_of_days"
    t.string "elevation_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accomodations", "trails"
  add_foreign_key "itineraries", "trails"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reservations", "accomodations"
  add_foreign_key "reservations", "itineraries"
end
