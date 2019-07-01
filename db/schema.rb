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

ActiveRecord::Schema.define(version: 2019_05_15_170046) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "evaluation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "be_evaluated_id", null: false
    t.string "evaluator_id", null: false
    t.string "item_id", null: false
    t.integer "status", null: false
    t.integer "evaluator_type", null: false
    t.text "comment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["be_evaluated_id", "created_at"], name: "index_evaluation_comments_on_be_evaluated_id_and_created_at"
    t.index ["evaluator_id"], name: "fk_rails_07849153e8"
    t.index ["item_id"], name: "index_evaluation_comments_on_item_id"
  end

  create_table "items", id: :string, limit: 36, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.integer "status", null: false
    t.integer "trading_status", default: 0, null: false
    t.integer "eval_status", default: 0, null: false
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

  create_table "user_evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_id", null: false
    t.integer "good", default: 0, null: false
    t.integer "normal", default: 0, null: false
    t.integer "bad", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_evaluations_on_user_id"
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
    t.string "nickname", null: false
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "evaluation_comments", "users", column: "be_evaluated_id"
  add_foreign_key "evaluation_comments", "users", column: "evaluator_id"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "private_messages", "items"
  add_foreign_key "private_messages", "users", column: "recepient_id"
  add_foreign_key "private_messages", "users", column: "sender_id"
  add_foreign_key "public_messages", "items"
  add_foreign_key "public_messages", "users", column: "sender_id"
  add_foreign_key "user_evaluations", "users"
end
