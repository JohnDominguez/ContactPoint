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

ActiveRecord::Schema.define(version: 20170614024610) do

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "quantity", limit: 24
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_carts_on_course_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "course_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "like"
    t.bigint "courses_id"
    t.bigint "users_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_id"], name: "index_course_ratings_on_courses_id"
    t.index ["users_id"], name: "index_course_ratings_on_users_id"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.float "price", limit: 24
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.bigint "products_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_product_carts_on_products_id"
    t.index ["users_id"], name: "index_product_carts_on_users_id"
  end

  create_table "product_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "like"
    t.bigint "products_id"
    t.bigint "users_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_product_ratings_on_products_id"
    t.index ["users_id"], name: "index_product_ratings_on_users_id"
  end

  create_table "product_stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "suppliers_id"
    t.bigint "products_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_product_stocks_on_products_id"
    t.index ["suppliers_id"], name: "index_product_stocks_on_suppliers_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sold_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "quantity", limit: 24
    t.float "price", limit: 24
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_sold_courses_on_cart_id"
    t.index ["course_id"], name: "index_sold_courses_on_course_id"
    t.index ["user_id"], name: "index_sold_courses_on_user_id"
  end

  create_table "sold_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.bigint "products_id"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_sold_products_on_products_id"
    t.index ["users_id"], name: "index_sold_products_on_users_id"
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "document_type", default: "CC", null: false
    t.integer "document_number", null: false
    t.datetime "birthday", null: false
    t.integer "points", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "courses"
  add_foreign_key "carts", "users"
  add_foreign_key "course_ratings", "courses", column: "courses_id"
  add_foreign_key "course_ratings", "users", column: "users_id"
  add_foreign_key "product_ratings", "products", column: "products_id"
  add_foreign_key "product_ratings", "users", column: "users_id"
  add_foreign_key "product_stocks", "products", column: "products_id"
  add_foreign_key "product_stocks", "suppliers", column: "suppliers_id"
  add_foreign_key "sold_courses", "carts"
  add_foreign_key "sold_courses", "courses"
  add_foreign_key "sold_courses", "users"
  add_foreign_key "sold_products", "products", column: "products_id"
  add_foreign_key "sold_products", "users", column: "users_id"
end
