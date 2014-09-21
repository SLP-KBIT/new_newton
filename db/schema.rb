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

ActiveRecord::Schema.define(version: 20140921040826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: true do |t|
    t.string   "name",           default: "",    null: false
    t.string   "place",          default: "",    null: false
    t.text     "attachments",    default: "",    null: false
    t.integer  "amount",                         null: false
    t.integer  "category",       default: 0,     null: false
    t.integer  "lending_period",                 null: false
    t.boolean  "trashed_flag",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lends", force: true do |t|
    t.integer  "user_id",       default: 0,     null: false
    t.integer  "item_id",       default: 0,     null: false
    t.integer  "amount",                        null: false
    t.integer  "status",        default: 0,     null: false
    t.boolean  "returned_flag", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reserves", force: true do |t|
    t.integer  "user_id",    default: 0,     null: false
    t.integer  "item_id",    default: 0,     null: false
    t.integer  "amount",                     null: false
    t.boolean  "lent_flag",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",           default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.boolean  "admin_flag",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
