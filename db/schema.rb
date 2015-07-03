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

ActiveRecord::Schema.define(version: 20150703173302) do

  create_table "items", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "attack_bonus",   limit: 4
    t.integer  "defence_bonus",  limit: 4
    t.integer  "coin_cost",      limit: 4
    t.integer  "required_level", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "items_players", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4
    t.integer "item_id",   limit: 4
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "level",      limit: 4
    t.integer  "exp",        limit: 4
    t.integer  "maxhealth",  limit: 4
    t.integer  "coins",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "players_spells", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4
    t.integer "spell_id",  limit: 4
  end

  create_table "spells", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "damage",         limit: 4
    t.integer  "prefab_type",    limit: 4
    t.integer  "cooldown_time",  limit: 4
    t.integer  "coin_cost",      limit: 4
    t.integer  "required_level", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
