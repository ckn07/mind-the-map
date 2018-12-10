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

ActiveRecord::Schema.define(version: 2018_12_10_102321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.bigint "poi_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "time_to_respond"
    t.integer "distance"
    t.index ["game_id"], name: "index_answers_on_game_id"
    t.index ["poi_id"], name: "index_answers_on_poi_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "theme_id"
    t.integer "user_one_id"
    t.integer "user_two_id"
    t.integer "score_one"
    t.integer "score_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_time_one"
    t.integer "total_time_two"
    t.integer "distance_one"
    t.integer "distance_two"
    t.index ["theme_id"], name: "index_games_on_theme_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.text "description"
    t.string "scrapping_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theme_pois", force: :cascade do |t|
    t.bigint "theme_id"
    t.bigint "poi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poi_id"], name: "index_theme_pois_on_poi_id"
    t.index ["theme_id"], name: "index_theme_pois_on_theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo", null: false
    t.index ["city_id"], name: "index_themes_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address", null: false
    t.string "photo", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "games"
  add_foreign_key "answers", "pois"
  add_foreign_key "answers", "users"
  add_foreign_key "games", "themes"
  add_foreign_key "games", "users", column: "user_one_id"
  add_foreign_key "games", "users", column: "user_two_id"
  add_foreign_key "theme_pois", "pois"
  add_foreign_key "theme_pois", "themes"
  add_foreign_key "themes", "cities"
end
