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

ActiveRecord::Schema.define(version: 20171222153504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "likes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "designer_events", force: :cascade do |t|
    t.integer "designer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string "external_id"
    t.string "designer_name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "external_id"
    t.string "address_business_name"
    t.string "address_street_1"
    t.string "address_street_2"
    t.string "slug"
    t.string "address_city"
    t.string "address_zip"
    t.string "event_name_en"
    t.string "start_date"
    t.string "end_date"
    t.string "summary"
    t.string "is_hot", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_hero_url"
    t.float "longitude"
    t.float "latitude"
    t.string "event_logo_pin"
  end

  create_table "user_designers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "photo"
    t.integer "city_id"
    t.string "username"
    t.string "twitter"
    t.string "instagram"
    t.text "bio"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
