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

ActiveRecord::Schema.define(version: 20161229172517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "authentication_token", default: ""
    t.float    "latitude"
    t.float    "longitude"
    t.index ["authentication_token"], name: "index_ambulance_users_on_authentication_token", unique: true, using: :btree
  end

  create_table "beds", force: :cascade do |t|
    t.string   "name"
    t.integer  "hospital_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "vacant",      default: true
    t.index ["hospital_id"], name: "index_beds_on_hospital_id", using: :btree
  end

  create_table "hospital_super_users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "hospital_id"
    t.index ["hospital_id"], name: "index_hospital_super_users_on_hospital_id", using: :btree
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "managers", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "hospital_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["hospital_id"], name: "index_managers_on_hospital_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.bigint   "cnic",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnic"], name: "index_patients_on_cnic", unique: true, using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "ambulance_user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "accepted",           default: false
    t.boolean  "completed",          default: false
    t.integer  "bed_id"
    t.string   "requests_type"
    t.string   "blood_pressure"
    t.string   "temperature"
    t.string   "breathing"
    t.string   "pulse_rate"
    t.bigint   "cnic"
    t.boolean  "critical_condition", default: false
    t.index ["ambulance_user_id"], name: "index_requests_on_ambulance_user_id", using: :btree
    t.index ["bed_id"], name: "index_requests_on_bed_id", using: :btree
    t.index ["hospital_id"], name: "index_requests_on_hospital_id", using: :btree
  end

end
