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

ActiveRecord::Schema.define(version: 20160608065143) do

  create_table "articles", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "title"
    t.string   "caption"
    t.string   "image"
    t.string   "content"
    t.boolean  "featured",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "curriculums", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

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
    t.string   "honorifics"
    t.text     "counseling_hours"
    t.integer  "department_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"

  create_table "events", force: :cascade do |t|
    t.string   "venue"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "graduates", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "year_graduated"
    t.text     "awards"
    t.integer  "department_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "graduates", ["department_id"], name: "index_graduates_on_department_id"

  create_table "images", force: :cascade do |t|
    t.string   "alt",               default: ""
    t.string   "hint",              default: ""
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "linkages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "linkages", ["department_id"], name: "index_linkages_on_department_id"

  create_table "news", force: :cascade do |t|
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "outreach_programs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "researches", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "group_name"
    t.string   "attachment"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "researches", ["department_id"], name: "index_researches_on_department_id"

  create_table "static_pages", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.string   "role"
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
