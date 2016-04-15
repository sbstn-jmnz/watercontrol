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

ActiveRecord::Schema.define(version: 20160415192204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charge_parameters", force: :cascade do |t|
    t.decimal  "fixed"
    t.decimal  "normal_price"
    t.decimal  "over_consumption_price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "condo_id"
  end

  add_index "charge_parameters", ["condo_id"], name: "index_charge_parameters_on_condo_id", using: :btree

  create_table "condos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "measure_processes", force: :cascade do |t|
    t.string   "status"
    t.datetime "closed_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.decimal  "fixed"
    t.decimal  "normal_price"
    t.decimal  "over_consumption_price"
  end

  create_table "measures", force: :cascade do |t|
    t.integer  "meter_id"
    t.integer  "value"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.text     "comment"
    t.string   "status"
    t.integer  "measure_process_id"
  end

  add_index "measures", ["measure_process_id"], name: "index_measures_on_measure_process_id", using: :btree
  add_index "measures", ["meter_id"], name: "index_measures_on_meter_id", using: :btree
  add_index "measures", ["user_id"], name: "index_measures_on_user_id", using: :btree

  create_table "meters", force: :cascade do |t|
    t.integer  "plot_id"
    t.string   "number"
    t.string   "status"
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
    t.string   "plot_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
    t.string   "status"
    t.integer  "sector_id"
  end

  add_index "plots", ["owner_id"], name: "index_plots_on_owner_id", using: :btree
  add_index "plots", ["sector_id"], name: "index_plots_on_sector_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "condo_id"
  end

  add_index "sectors", ["condo_id"], name: "index_sectors_on_condo_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "rut"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree

  add_foreign_key "charge_parameters", "condos"
  add_foreign_key "measures", "measure_processes"
  add_foreign_key "measures", "meters"
  add_foreign_key "measures", "users"
  add_foreign_key "meters", "plots"
  add_foreign_key "plots", "owners"
  add_foreign_key "plots", "sectors"
  add_foreign_key "sectors", "condos"
end
