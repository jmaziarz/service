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

ActiveRecord::Schema.define(version: 20150506202117) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "overseer_id"
    t.integer  "assistant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.boolean  "is_pioneer",  default: false
    t.boolean  "is_elder",    default: false
    t.boolean  "is_servant",  default: false
    t.boolean  "is_inactive", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "telephone"
    t.boolean  "is_texting"
    t.integer  "group_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.integer  "books",                 default: 0
    t.integer  "brochures",             default: 0
    t.integer  "magazines",             default: 0
    t.integer  "visits",                default: 0
    t.integer  "studies",               default: 0
    t.float    "hours",                 default: 0.0
    t.boolean  "is_auxilliary_pioneer", default: false
    t.boolean  "is_recorded",           default: false
    t.integer  "publisher_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

end
