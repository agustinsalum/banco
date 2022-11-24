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

ActiveRecord::Schema[7.0].define(version: 2022_11_17_232045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "localities", force: :cascade do |t|
    t.string "name_locality"
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_locality", "province_id"], name: "index_localities_on_name_locality_and_province_id", unique: true
    t.index ["province_id"], name: "index_localities_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name_province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_province"], name: "index_provinces_on_name_province", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day_week"
    t.time "hour_since"
    t.time "hour_until"
    t.datetime "schedule_date"
    t.bigint "subsidiary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_week", "subsidiary_id"], name: "index_schedules_on_day_week_and_subsidiary_id", unique: true
    t.index ["subsidiary_id"], name: "index_schedules_on_subsidiary_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name_subsidiary"
    t.string "address"
    t.string "phone"
    t.bigint "locality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_subsidiaries_on_locality_id"
    t.index ["name_subsidiary"], name: "index_subsidiaries_on_name_subsidiary", unique: true
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "turn_date"
    t.time "hour"
    t.string "reason_turn"
    t.string "comment"
    t.string "state"
    t.bigint "subsidiary_id", null: false
    t.bigint "user_client_id", null: false
    t.bigint "user_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subsidiary_id"], name: "index_turns_on_subsidiary_id"
    t.index ["turn_date", "hour", "subsidiary_id"], name: "index_turns_on_turn_date_and_hour_and_subsidiary_id", unique: true
    t.index ["user_bank_id"], name: "index_turns_on_user_bank_id"
    t.index ["user_client_id"], name: "index_turns_on_user_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 3
    t.bigint "subsidiary_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subsidiary_id"], name: "index_users_on_subsidiary_id"
  end

  add_foreign_key "localities", "provinces"
  add_foreign_key "schedules", "subsidiaries"
  add_foreign_key "subsidiaries", "localities"
  add_foreign_key "turns", "subsidiaries"
  add_foreign_key "turns", "users", column: "user_bank_id"
  add_foreign_key "turns", "users", column: "user_client_id"
  add_foreign_key "users", "subsidiaries"
end
