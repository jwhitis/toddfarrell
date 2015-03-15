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

ActiveRecord::Schema.define(version: 20150315030737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shows", force: :cascade do |t|
    t.string   "venue_name", limit: 255
    t.date     "date"
    t.string   "cover",      limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time",       limit: 255
    t.boolean  "published"
    t.string   "venue_url"
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "handle",      limit: 255
    t.string   "image_url",   limit: 255
    t.text     "text"
    t.datetime "posted_at"
    t.integer  "twitter_id",  limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "profile_url"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "caption"
    t.text     "embed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

end
