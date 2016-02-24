# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160221084529) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["hall_id"], name: "index_cities_on_hall_id"

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hall_id"
  end

  create_table "event_types_halls", id: false, force: :cascade do |t|
    t.integer "hall_id",       null: false
    t.integer "event_type_id", null: false
  end

  create_table "hall_options", id: false, force: :cascade do |t|
    t.integer "hall_id",   null: false
    t.integer "option_id", null: false
  end

  create_table "halls", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "price"
    t.string   "event_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photos"
    t.string   "name"
    t.integer  "city_id"
    t.integer  "venue_type_id"
    t.boolean  "checked"
  end

  create_table "halls_venue_types", id: false, force: :cascade do |t|
    t.integer "hall_id"
    t.integer "venue_type_id"
  end

  add_index "halls_venue_types", ["hall_id"], name: "index_halls_venue_types_on_hall_id"
  add_index "halls_venue_types", ["venue_type_id"], name: "index_halls_venue_types_on_venue_type_id"

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["hall_id"], name: "index_options_on_hall_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "description"
    t.integer  "hall_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venue_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venue_types", ["hall_id"], name: "index_venue_types_on_hall_id"

end
