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

ActiveRecord::Schema.define(version: 20170722010320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campus_employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "campus_subjects", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "employee_id"
  end

  create_table "employee_subjects", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "subject_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "courses_tutored"
  end

  create_table "employee_time_slots", force: :cascade do |t|
    t.integer  "timeslot_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "bio"
    t.boolean  "admin",           default: false
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "approved",        default: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone_number"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chatroom_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
    t.boolean  "read"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "employee_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "student_email"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.string   "question4"
    t.string   "question5"
    t.string   "question6"
    t.string   "question7"
    t.string   "question8"
    t.string   "question9"
    t.text     "question10"
    t.text     "question11"
    t.text     "question12"
    t.text     "question13"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.string   "days"
    t.string   "semester"
    t.boolean  "approved",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
