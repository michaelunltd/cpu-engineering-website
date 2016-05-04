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

ActiveRecord::Schema.define(version: 20160504022311) do

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.text     "message"
    t.text     "vision"
    t.text     "mission"
    t.text     "history"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "position"
    t.string   "honorifics"
    t.text     "counseling_hours"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "venue"
    t.string   "image"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "linkages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "about"
    t.string   "mission"
    t.string   "vision"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
