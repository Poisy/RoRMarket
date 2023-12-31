# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_09_131118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.string "redemption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.string "status"
    t.bigint "product_id", null: false
    t.float "amount"
    t.integer "activation_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.index ["product_id"], name: "index_cards_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "brand_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.integer "reference_number"
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
  end

  add_foreign_key "cards", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "transactions", "cards"
end
