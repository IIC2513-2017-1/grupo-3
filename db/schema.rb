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

ActiveRecord::Schema.define(version: 20170505031708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_dishes", id: false, force: :cascade do |t|
    t.integer "dish_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.string   "description"
    t.integer  "times_buyed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_dishes_on_user_id", using: :btree
  end

  create_table "dishes_pictures", id: false, force: :cascade do |t|
    t.integer "dish_id",    null: false
    t.integer "picture_id", null: false
  end

  create_table "dishes_tags", id: false, force: :cascade do |t|
    t.integer "dish_id", null: false
    t.integer "tag_id",  null: false
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
    t.integer  "dish_id"
    t.integer  "user_id"
    t.index ["dish_id"], name: "index_orders_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "dish_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
    t.integer  "user_id"
    t.integer  "dish_id"
    t.index ["dish_id"], name: "index_reviews_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                               null: false
    t.string   "address"
    t.integer  "points",              default: 0
    t.string   "phone"
    t.string   "gender"
    t.date     "birth_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.boolean  "visible"
    t.boolean  "terms"
    t.boolean  "seal"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",           default: false
    t.datetime "activated_at"
  end

  add_foreign_key "dishes", "users"
  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "users"
end
