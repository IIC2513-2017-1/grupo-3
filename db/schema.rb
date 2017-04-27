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

ActiveRecord::Schema.define(version: 20170421173259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooks", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "visible"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "address"
    t.float    "score"
    t.string   "phone"
    t.string   "gender"
    t.boolean  "seal"
    t.date     "birth_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "terms_of_service"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.integer  "times_buyed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "final_price"
    t.string   "status"
    t.boolean  "tipping"
    t.integer  "tips"
    t.string   "payment_method"
    t.time     "delivery_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "card_number"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "forks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "points"
    t.string   "phone"
    t.string   "gender"
    t.date     "birth_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
