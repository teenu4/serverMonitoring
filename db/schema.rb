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

ActiveRecord::Schema.define(version: 2021_12_28_200236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifiers", force: :cascade do |t|
    t.string "platform"
    t.json "credentials"
    t.boolean "active", default: false
    t.bigint "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_notifiers_on_website_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "roles", default: ["USER"], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "website_visits", force: :cascade do |t|
    t.bigint "website_id"
    t.integer "status_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["website_id"], name: "index_website_visits_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "schedule"
    t.datetime "last_visit", precision: 6
    t.integer "min_interval", default: 0
  end

end
