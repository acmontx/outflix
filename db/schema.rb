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


ActiveRecord::Schema.define(version: 2020_03_10_163939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "genre"
    t.string "netflix_id"
    t.string "image_url"
    t.string "plot"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "runtime"
    t.string "imdb_id"
    t.float "imdb_rating"
    t.jsonb "cast"
    t.jsonb "details"
    t.float "netflix_rating"
    t.string "country_code"
    t.index ["country_code", "netflix_id"], name: "index_contents_on_country_code_and_netflix_id", unique: true
    t.index ["netflix_id"], name: "index_contents_on_netflix_id"
  end

  create_table "netflix_api_calls", force: :cascade do |t|
    t.jsonb "body"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query"], name: "index_netflix_api_calls_on_query", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.datetime "date_sent"
    t.boolean "read"
    t.string "medium"
    t.bigint "user_content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "frequency"
    t.index ["user_content_id"], name: "index_notifications_on_user_content_id"
  end

  create_table "user_contents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "content_id"
    t.boolean "in_my_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_user_contents_on_content_id"
    t.index ["user_id"], name: "index_user_contents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "frequency"
    t.string "medium"
    t.string "notification_size"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "notifications", "user_contents"
  add_foreign_key "user_contents", "contents"
  add_foreign_key "user_contents", "users"
end
