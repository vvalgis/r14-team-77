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

ActiveRecord::Schema.define(version: 20141019160319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bees", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "name"
  end

  add_index "bees", ["activation_token"], name: "index_bees_on_activation_token", using: :btree
  add_index "bees", ["remember_me_token"], name: "index_bees_on_remember_me_token", using: :btree
  add_index "bees", ["reset_password_token"], name: "index_bees_on_reset_password_token", using: :btree

  create_table "combs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "visibility",  default: 0, null: false
    t.integer  "hive_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "combs", ["author_id"], name: "index_combs_on_author_id", using: :btree
  add_index "combs", ["hive_id"], name: "index_combs_on_hive_id", using: :btree
  add_index "combs", ["visibility"], name: "index_combs_on_visibility", using: :btree

  create_table "hive_memberships", force: true do |t|
    t.integer  "hive_id"
    t.integer  "bee_id"
    t.boolean  "is_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hive_memberships", ["bee_id"], name: "index_hive_memberships_on_bee_id", using: :btree
  add_index "hive_memberships", ["hive_id"], name: "index_hive_memberships_on_hive_id", using: :btree

  create_table "hives", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
