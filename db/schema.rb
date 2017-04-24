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

ActiveRecord::Schema.define(version: 20170423212855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id",    null: false
    t.integer "product_id",     null: false
    t.integer "category_id_id"
    t.integer "product_id_id"
    t.index ["category_id_id"], name: "index_categories_products_on_category_id_id", using: :btree
    t.index ["product_id_id"], name: "index_categories_products_on_product_id_id", using: :btree
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "merchant_name"
    t.string   "merchant_email"
    t.string   "username"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "oauth_uid"
    t.string   "oauth_provider"
  end

  create_table "orderproducts", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orderproducts_on_order_id", using: :btree
    t.index ["product_id"], name: "index_orderproducts_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "cc_num"
    t.string   "cc_name"
    t.string   "order_email"
    t.string   "mailing_address"
    t.string   "cc_expiry"
    t.integer  "buyer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.float    "price"
    t.integer  "merchant_id"
    t.string   "photo_url"
    t.integer  "stock"
    t.string   "product_description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["merchant_id"], name: "index_products_on_merchant_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "rating"
    t.string   "review_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["product_id"], name: "index_reviews_on_product_id", using: :btree
  end

end
