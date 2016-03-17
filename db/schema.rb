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

ActiveRecord::Schema.define(version: 20160316195716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "measures", force: :cascade do |t|
    t.integer  "meter_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "measures", ["meter_id"], name: "index_measures_on_meter_id", using: :btree

  create_table "meters", force: :cascade do |t|
    t.integer  "plot_id"
    t.string   "number"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meters", ["plot_id"], name: "index_meters_on_plot_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plots", force: :cascade do |t|
    t.integer  "condo_id"
    t.string   "plot_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
    t.string   "state"
  end

  add_index "plots", ["condo_id"], name: "index_plots_on_condo_id", using: :btree
  add_index "plots", ["owner_id"], name: "index_plots_on_owner_id", using: :btree

  add_foreign_key "measures", "meters"
  add_foreign_key "meters", "plots"
  add_foreign_key "plots", "condos"
  add_foreign_key "plots", "owners"
end
