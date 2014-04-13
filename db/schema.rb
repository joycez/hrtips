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

ActiveRecord::Schema.define(version: 20140413040828) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "brochures", force: true do |t|
    t.string   "topic"
    t.string   "name"
    t.integer  "group_id"
    t.text     "content",        limit: 2147483647
    t.string   "pdf_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "author_hist"
    t.integer  "admin_id"
    t.integer  "language"
    t.text     "authored_by"
    t.text     "updated_by"
    t.integer  "prod_id"
    t.text     "a_desc"
    t.text     "u_desc"
    t.string   "raw_created_at", limit: 100
    t.string   "raw_updated_at", limit: 100
  end

  create_table "brochures_resources", force: true do |t|
    t.integer  "brochure_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "glossaries", force: true do |t|
    t.string   "term"
    t.text     "definition"
    t.integer  "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.integer  "updated_by"
  end

  create_table "resources", force: true do |t|
    t.string   "name"
    t.string   "p_voice"
    t.string   "p_fax"
    t.string   "p_tty"
    t.string   "p_other"
    t.string   "p_other_desc"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "url"
    t.text     "desc"
    t.integer  "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.integer  "updated_by"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
