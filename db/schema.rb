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

ActiveRecord::Schema.define(version: 20170606165617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "account_type",   null: false
    t.string   "account",        null: false
    t.string   "bank",           null: false
    t.string   "id_card_number", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "cart_id"
    t.decimal  "price",      precision: 12, scale: 3
    t.integer  "amount"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status",     default: "pending"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_dishes", id: false, force: :cascade do |t|
    t.integer "dish_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "categorizings", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categorizings_on_category_id", using: :btree
    t.index ["dish_id"], name: "index_categorizings_on_dish_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                       null: false
    t.integer  "price",                      null: false
    t.string   "description"
    t.integer  "times_buyed"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "active",      default: true
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

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "favorited_type"
    t.integer  "favorited_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["favorited_type", "favorited_id"], name: "index_favorites_on_favorited_type_and_favorited_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "pending",                              default: true
    t.index ["dish_id"], name: "index_order_items_on_dish_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "final_price",           precision: 12, scale: 3
    t.string   "status"
    t.boolean  "tipping"
    t.decimal  "tips",                  precision: 12, scale: 3
    t.string   "payment_method"
    t.time     "delivery_time"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "dish_id"
    t.integer  "user_id"
    t.string   "customer_email"
    t.string   "customer_phone_number"
    t.string   "deliver_to_first_name"
    t.string   "deliver_to_last_name"
    t.string   "deliver_to_address"
    t.string   "customer_ip"
    t.index ["dish_id"], name: "index_orders_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "dish_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "main_image",         default: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "dish_id"
    t.string   "title"
    t.integer  "forks",      default: 0
    t.index ["dish_id"], name: "index_reviews_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_taggings_on_dish_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
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
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "bank_accounts", "users", on_delete: :cascade
  add_foreign_key "categorizings", "categories"
  add_foreign_key "categorizings", "dishes"
  add_foreign_key "dishes", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "order_items", "dishes"
  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "users"
  add_foreign_key "taggings", "dishes"
  add_foreign_key "taggings", "tags"
end
