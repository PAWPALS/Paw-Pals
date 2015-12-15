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

ActiveRecord::Schema.define(version: 20151215222250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.integer  "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
  end

  create_table "pet_check_ins", force: :cascade do |t|
    t.integer  "pet_id",              null: false
    t.float    "longitude",           null: false
    t.float    "latitude",            null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "adafruit_created_at", null: false
    t.integer  "adafruit_id",         null: false
  end

  create_table "pet_notices", force: :cascade do |t|
    t.integer  "pet_id",     null: false
    t.float    "longitude",  null: false
    t.float    "latitude",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.string   "name",                null: false
    t.string   "breed",               null: false
    t.integer  "age",                 null: false
    t.string   "description",         null: false
    t.string   "present",             null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "last_checkin_time"
    t.string   "mobile_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "access_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
