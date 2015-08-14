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

ActiveRecord::Schema.define(version: 20150814032024) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  create_table "states", force: true do |t|
    t.string   "name",       null: false
    t.string   "code",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["code"], name: "index_states_on_code", unique: true
  add_index "states", ["name"], name: "index_states_on_name", unique: true

  create_table "zip_codes", force: true do |t|
    t.string   "zip",        null: false
    t.string   "city"
    t.string   "county"
    t.integer  "state_id",   null: false
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zip_codes", ["zip"], name: "index_zip_codes_on_zip", unique: true

end
