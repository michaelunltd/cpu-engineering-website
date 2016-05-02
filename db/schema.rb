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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160502044318) do
=======
ActiveRecord::Schema.define(version: 20160502075407) do

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
>>>>>>> 3f9c6528bd34a4d79169faea499d34ab74ba0e2c

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "venue"
    t.string   "image"
<<<<<<< HEAD
    t.datetime "startDate"
    t.datetime "endDate"
=======
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "linkages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
>>>>>>> 3f9c6528bd34a4d79169faea499d34ab74ba0e2c
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "img_path"
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
