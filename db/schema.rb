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

ActiveRecord::Schema.define(version: 20170226204022) do

  create_table "nifty_key_value_store", force: :cascade do |t|
    t.integer "parent_id"
    t.string  "parent_type"
    t.string  "group"
    t.string  "name"
    t.string  "value"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "ordered_item_type"
    t.integer  "ordered_item_id"
    t.integer  "quantity",                                  default: 1
    t.decimal  "unit_price",        precision: 8, scale: 2
    t.decimal  "tax_rate",          precision: 8, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "postcards", force: :cascade do |t|
    t.string   "title"
    t.string   "body",              null: false
    t.string   "description",       null: false
    t.string   "short_description", null: false
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "postcards", ["category_id"], name: "index_postcards_on_category_id"

  create_table "shoppe_addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "address_type"
    t.boolean  "default"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "address4"
    t.string   "postcode"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_addresses", ["customer_id"], name: "index_shoppe_addresses_on_customer_id"

  create_table "shoppe_attachments", force: :cascade do |t|
    t.integer  "parent_id",   null: false
    t.string   "parent_type", null: false
    t.string   "token"
    t.string   "file",        null: false
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_type"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_countries", force: :cascade do |t|
    t.string  "name"
    t.string  "code2"
    t.string  "code3"
    t.string  "continent"
    t.string  "tld"
    t.string  "currency"
    t.boolean "eu_member", default: false
  end

  create_table "shoppe_customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_delivery_service_prices", force: :cascade do |t|
    t.integer  "delivery_service_id"
    t.string   "code"
    t.decimal  "price",               precision: 8, scale: 2
    t.decimal  "cost_price",          precision: 8, scale: 2
    t.integer  "tax_rate_id"
    t.decimal  "min_weight",          precision: 8, scale: 2
    t.decimal  "max_weight",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
  end

  add_index "shoppe_delivery_service_prices", ["delivery_service_id"], name: "index_shoppe_delivery_service_prices_on_delivery_service_id"
  add_index "shoppe_delivery_service_prices", ["max_weight"], name: "index_shoppe_delivery_service_prices_on_max_weight"
  add_index "shoppe_delivery_service_prices", ["min_weight"], name: "index_shoppe_delivery_service_prices_on_min_weight"
  add_index "shoppe_delivery_service_prices", ["price"], name: "index_shoppe_delivery_service_prices_on_price"

  create_table "shoppe_delivery_services", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "default",      default: false
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "courier"
    t.string   "tracking_url"
  end

  add_index "shoppe_delivery_services", ["active"], name: "index_shoppe_delivery_services_on_active"

  create_table "shoppe_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "ordered_item_id"
    t.string   "ordered_item_type"
    t.integer  "quantity",                                  default: 1
    t.decimal  "unit_price",        precision: 8, scale: 2
    t.decimal  "unit_cost_price",   precision: 8, scale: 2
    t.decimal  "tax_amount",        precision: 8, scale: 2
    t.decimal  "tax_rate",          precision: 8, scale: 2
    t.decimal  "weight",            precision: 8, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_order_items", ["order_id"], name: "index_shoppe_order_items_on_order_id"
  add_index "shoppe_order_items", ["ordered_item_id", "ordered_item_type"], name: "index_shoppe_order_items_ordered_item"

  create_table "shoppe_orders", force: :cascade do |t|
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_address3"
    t.string   "billing_address4"
    t.string   "billing_postcode"
    t.integer  "billing_country_id"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "status"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_service_id"
    t.decimal  "delivery_price",            precision: 8, scale: 2
    t.decimal  "delivery_cost_price",       precision: 8, scale: 2
    t.decimal  "delivery_tax_rate",         precision: 8, scale: 2
    t.decimal  "delivery_tax_amount",       precision: 8, scale: 2
    t.integer  "accepted_by"
    t.integer  "shipped_by"
    t.string   "consignment_number"
    t.datetime "rejected_at"
    t.integer  "rejected_by"
    t.string   "ip_address"
    t.text     "notes"
    t.boolean  "separate_delivery_address",                         default: false
    t.string   "delivery_name"
    t.string   "delivery_address1"
    t.string   "delivery_address2"
    t.string   "delivery_address3"
    t.string   "delivery_address4"
    t.string   "delivery_postcode"
    t.integer  "delivery_country_id"
    t.decimal  "amount_paid",               precision: 8, scale: 2, default: 0.0
    t.boolean  "exported",                                          default: false
    t.string   "invoice_number"
    t.integer  "customer_id"
  end

  add_index "shoppe_orders", ["delivery_service_id"], name: "index_shoppe_orders_on_delivery_service_id"
  add_index "shoppe_orders", ["received_at"], name: "index_shoppe_orders_on_received_at"
  add_index "shoppe_orders", ["token"], name: "index_shoppe_orders_on_token"

  create_table "shoppe_payments", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: 0.0
    t.string   "reference"
    t.string   "method"
    t.boolean  "confirmed",                                 default: true
    t.boolean  "refundable",                                default: false
    t.decimal  "amount_refunded",   precision: 8, scale: 2, default: 0.0
    t.integer  "parent_payment_id"
    t.boolean  "exported",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_payments", ["order_id"], name: "index_shoppe_payments_on_order_id"
  add_index "shoppe_payments", ["parent_payment_id"], name: "index_shoppe_payments_on_parent_payment_id"

  create_table "shoppe_product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "key"
    t.string   "value"
    t.integer  "position",   default: 1
    t.boolean  "searchable", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",     default: true
  end

  add_index "shoppe_product_attributes", ["key"], name: "index_shoppe_product_attributes_on_key"
  add_index "shoppe_product_attributes", ["position"], name: "index_shoppe_product_attributes_on_position"
  add_index "shoppe_product_attributes", ["product_id"], name: "index_shoppe_product_attributes_on_product_id"

  create_table "shoppe_product_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "ancestral_permalink"
    t.boolean  "permalink_includes_ancestors", default: false
  end

  add_index "shoppe_product_categories", ["lft"], name: "index_shoppe_product_categories_on_lft"
  add_index "shoppe_product_categories", ["permalink"], name: "index_shoppe_product_categories_on_permalink"
  add_index "shoppe_product_categories", ["rgt"], name: "index_shoppe_product_categories_on_rgt"

  create_table "shoppe_product_categorizations", force: :cascade do |t|
    t.integer "product_id",          null: false
    t.integer "product_category_id", null: false
  end

  add_index "shoppe_product_categorizations", ["product_category_id"], name: "categorization_by_product_category_id"
  add_index "shoppe_product_categorizations", ["product_id"], name: "categorization_by_product_id"

  create_table "shoppe_product_category_translations", force: :cascade do |t|
    t.integer  "shoppe_product_category_id", null: false
    t.string   "locale",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
  end

  add_index "shoppe_product_category_translations", ["locale"], name: "index_shoppe_product_category_translations_on_locale"
  add_index "shoppe_product_category_translations", ["shoppe_product_category_id"], name: "index_75826cc72f93d014e54dc08b8202892841c670b4"

  create_table "shoppe_product_translations", force: :cascade do |t|
    t.integer  "shoppe_product_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.text     "short_description"
  end

  add_index "shoppe_product_translations", ["locale"], name: "index_shoppe_product_translations_on_locale"
  add_index "shoppe_product_translations", ["shoppe_product_id"], name: "index_shoppe_product_translations_on_shoppe_product_id"

  create_table "shoppe_products", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "sku"
    t.string   "permalink"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active",                                    default: true
    t.decimal  "weight",            precision: 8, scale: 3, default: 0.0
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_price",        precision: 8, scale: 2, default: 0.0
    t.integer  "tax_rate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                                  default: false
    t.text     "in_the_box"
    t.boolean  "stock_control",                             default: true
    t.boolean  "default",                                   default: false
  end

  add_index "shoppe_products", ["parent_id"], name: "index_shoppe_products_on_parent_id"
  add_index "shoppe_products", ["permalink"], name: "index_shoppe_products_on_permalink"
  add_index "shoppe_products", ["sku"], name: "index_shoppe_products_on_sku"

  create_table "shoppe_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "value_type"
  end

  add_index "shoppe_settings", ["key"], name: "index_shoppe_settings_on_key"

  create_table "shoppe_stock_level_adjustments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "description"
    t.integer  "adjustment",  default: 0
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_stock_level_adjustments", ["item_id", "item_type"], name: "index_shoppe_stock_level_adjustments_items"
  add_index "shoppe_stock_level_adjustments", ["parent_id", "parent_type"], name: "index_shoppe_stock_level_adjustments_parent"

  create_table "shoppe_tax_rates", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rate",         precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
    t.string   "address_type"
  end

  create_table "shoppe_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_users", ["email_address"], name: "index_shoppe_users_on_email_address"

end
