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

ActiveRecord::Schema.define(version: 20190104065753) do

  create_table "booking_fields", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "field_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "price", null: false
    t.integer "payment_method", null: false
    t.boolean "payment", default: false, null: false
    t.boolean "confirm", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_booking_fields_on_field_id"
    t.index ["team_id"], name: "index_booking_fields_on_team_id"
  end

  create_table "booking_tournaments", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.integer "team_id", null: false
    t.integer "price", null: false
    t.integer "payment_method", null: false
    t.boolean "payment", default: false, null: false
    t.boolean "confirm", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_booking_tournaments_on_team_id"
    t.index ["tournament_id"], name: "index_booking_tournaments_on_tournament_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "prefecture"
    t.string "city"
    t.integer "num_of_field"
    t.integer "price"
    t.index ["confirmation_token"], name: "index_fields_on_confirmation_token", unique: true
    t.index ["email"], name: "index_fields_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fields_on_reset_password_token", unique: true
  end

  create_table "game_results", force: :cascade do |t|
    t.integer "team1_id", null: false
    t.integer "team2_id", null: false
    t.integer "score_by_team1", null: false
    t.integer "score_by_team2", null: false
    t.integer "tournament_id"
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team1_id"], name: "index_game_results_on_team1_id"
    t.index ["team2_id"], name: "index_game_results_on_team2_id"
    t.index ["tournament_id"], name: "index_game_results_on_tournament_id"
  end

  create_table "play_fors", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "register", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.index ["player_id"], name: "index_play_fors_on_player_id"
    t.index ["team_id"], name: "index_play_fors_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.date "birthday"
    t.integer "height"
    t.integer "weight"
    t.string "name", default: "", null: false
    t.integer "default_team_id"
    t.index ["confirmation_token"], name: "index_players_on_confirmation_token", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "scores", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.integer "game_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_result_id"], name: "index_scores_on_game_result_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level", default: 4, null: false
    t.integer "plyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plyer_id"], name: "index_teams_on_plyer_id"
  end

  create_table "tournament_companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_tournament_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tournament_companies_on_reset_password_token", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "num_of_team", default: 0, null: false
    t.integer "field_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "price", null: false
    t.integer "tournament_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level", null: false
    t.string "name", null: false
    t.index ["field_id"], name: "index_tournaments_on_field_id"
    t.index ["tournament_company_id"], name: "index_tournaments_on_tournament_company_id"
  end

end
