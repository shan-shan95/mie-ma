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

ActiveRecord::Schema.define(version: 2019_05_01_042924) do

  create_table "evaluation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.integer "status", null: false
    t.text "comment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_comments_on_evaluation_id"
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_id", null: false
    t.integer "good", default: 0, null: false
    t.integer "normal", default: 0, null: false
    t.integer "bad", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "items", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.integer "status", null: false
    t.integer "trading_status", default: 0, null: false
    t.string "buyer_id"
    t.string "seller_id", null: false
    t.date "start_on", null: false
    t.date "end_on"
    t.integer "view", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["created_at"], name: "index_items_on_created_at"
    t.index ["id"], name: "index_items_on_id", unique: true
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "private_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "sender_id", null: false
    t.string "recepient_id", null: false
    t.string "item_id", null: false
    t.text "content", limit: 255, null: false
    t.boolean "is_already_read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "created_at"], name: "index_private_messages_on_item_id_and_created_at"
    t.index ["item_id"], name: "index_private_messages_on_item_id"
    t.index ["recepient_id"], name: "fk_rails_437400e488"
    t.index ["sender_id"], name: "fk_rails_747f84c937"
  end

  create_table "public_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "sender_id", null: false
    t.string "item_id", null: false
    t.text "content", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "created_at"], name: "index_public_messages_on_item_id_and_created_at"
    t.index ["item_id"], name: "index_public_messages_on_item_id"
    t.index ["sender_id"], name: "fk_rails_2764a73ff0"
  end

  create_table "users", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluation_comments", "evaluations"
  add_foreign_key "evaluations", "users"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "private_messages", "items"
  add_foreign_key "private_messages", "users", column: "recepient_id"
  add_foreign_key "private_messages", "users", column: "sender_id"
  add_foreign_key "public_messages", "items"
  add_foreign_key "public_messages", "users", column: "sender_id"
end
