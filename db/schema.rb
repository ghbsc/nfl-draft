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

ActiveRecord::Schema.define(version: 20140204033453) do

  create_table "orders", force: true do |t|
    t.integer  "round"
    t.integer  "pick"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "team_name"
  end

  add_index "orders", ["team_id"], name: "index_orders_on_team_id"

  create_table "ownerships", force: true do |t|
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "drafted_on"
    t.integer  "order_id"
    t.integer  "player_id"
  end

  add_index "ownerships", ["order_id"], name: "index_ownerships_on_order_id"
  add_index "ownerships", ["player_id"], name: "index_ownerships_on_player_id"
  add_index "ownerships", ["team_id"], name: "index_ownerships_on_team_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "division"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
