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

ActiveRecord::Schema.define(version: 20160728123050) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ambulance_users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "belongs_to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "beds", force: :cascade do |t|
    t.string   "name"
    t.integer  "hospital_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "vacant",      default: true
  end

  add_index "beds", ["hospital_id"], name: "index_beds_on_hospital_id"

  create_table "hospital_super_users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "hospital_id"
  end

  add_index "hospital_super_users", ["hospital_id"], name: "index_hospital_super_users_on_hospital_id"

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "managers", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "hospital_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "managers", ["hospital_id"], name: "index_managers_on_hospital_id"

  create_table "patients", force: :cascade do |t|
    t.integer  "cnic",       limit: 8, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "patients", ["cnic"], name: "index_patients_on_cnic", unique: true

  create_table "request_details", force: :cascade do |t|
    t.string   "gender"
    t.string   "age"
    t.string   "blood_pressure"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "ambulance_user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "accepted",          default: false
    t.boolean  "completed",         default: false
    t.boolean  "data_received",     default: false
    t.integer  "bed_id"
  end

  add_index "requests", ["ambulance_user_id"], name: "index_requests_on_ambulance_user_id"
  add_index "requests", ["bed_id"], name: "index_requests_on_bed_id"
  add_index "requests", ["hospital_id"], name: "index_requests_on_hospital_id"

end
