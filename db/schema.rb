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

ActiveRecord::Schema.define(version: 20160409210021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "class_time"
    t.string   "coach_first_name"
    t.string   "coach_last_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "member_first_name"
    t.string   "member_last_name"
    t.integer  "age"
    t.string   "gender"
    t.string   "notes"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "status",            default: "Active"
    t.integer  "height_inches"
  end

  create_table "users", force: :cascade do |t|
    t.string   "gym_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
