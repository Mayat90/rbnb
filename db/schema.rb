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

ActiveRecord::Schema.define(version: 20171130165316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "user_place_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_place_id"], name: "index_availabilities_on_user_place_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_place_id"
    t.integer  "parent_id"
    t.integer  "babysitter_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "number_of_kids"
    t.integer  "review_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["babysitter_id"], name: "index_reservations_on_babysitter_id", using: :btree
    t.index ["parent_id"], name: "index_reservations_on_parent_id", using: :btree
    t.index ["review_id"], name: "index_reservations_on_review_id", using: :btree
    t.index ["user_place_id"], name: "index_reservations_on_user_place_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "babysitter_content"
    t.integer  "babysitter_stars"
    t.string   "parent_content"
    t.integer  "parent_stars"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "user_places", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "photo"
    t.integer  "capacity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_user_places_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "iban"
    t.integer  "number_of_kids"
    t.boolean  "babysitter"
    t.string   "photo"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "description"
    t.string   "cphoto"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "garde_a_domicile"
    t.integer  "capacity"
    t.string   "address"
    t.float    "price"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availabilities", "user_places"
  add_foreign_key "reservations", "reviews"
  add_foreign_key "reservations", "user_places"
  add_foreign_key "reservations", "users", column: "babysitter_id"
  add_foreign_key "reservations", "users", column: "parent_id"
  add_foreign_key "user_places", "users"
end
