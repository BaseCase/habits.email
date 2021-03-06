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

ActiveRecord::Schema.define(version: 20160824005740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "entries", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "habit_id"
    t.boolean  "successful", default: false, null: false
    t.date     "for_date",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["habit_id"], name: "index_entries_on_habit_id", using: :btree
  end

  create_table "habits", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "habit_name",                         null: false
    t.string   "user_name",                          null: false
    t.string   "email",                              null: false
    t.boolean  "active",             default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "confirmation_token"
    t.boolean  "confirmed",          default: false
    t.index ["active"], name: "index_habits_on_active", using: :btree
    t.index ["email"], name: "index_habits_on_email", using: :btree
  end

  add_foreign_key "entries", "habits"
end
