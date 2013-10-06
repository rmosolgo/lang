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

ActiveRecord::Schema.define(version: 20131006002351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diacritics", force: true do |t|
    t.string   "letter"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_sounds", force: true do |t|
    t.integer  "feature_id"
    t.integer  "sound_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feature_sounds", ["feature_id", "sound_id"], name: "index_feature_sounds_on_feature_id_and_sound_id", using: :btree
  add_index "feature_sounds", ["sound_id", "feature_id"], name: "index_feature_sounds_on_sound_id_and_feature_id", using: :btree

  create_table "features", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feature_type"
  end

  create_table "features_sounds", id: false, force: true do |t|
    t.integer "feature_id", null: false
    t.integer "sound_id",   null: false
  end

  add_index "features_sounds", ["feature_id", "sound_id"], name: "index_features_sounds_on_feature_id_and_sound_id", using: :btree
  add_index "features_sounds", ["sound_id", "feature_id"], name: "index_features_sounds_on_sound_id_and_feature_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phonemes", force: true do |t|
    t.integer  "sound_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sounds", force: true do |t|
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
