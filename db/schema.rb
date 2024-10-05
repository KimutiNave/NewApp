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

ActiveRecord::Schema[7.0].define(version: 2024_09_25_134444) do
  create_table "alerms", force: :cascade do |t|
    t.boolean "notice", default: false
    t.integer "another_post_id", null: false
    t.integer "user_id", null: false
    t.integer "file_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["another_post_id"], name: "index_alerms_on_another_post_id"
    t.index ["file_type_id"], name: "index_alerms_on_file_type_id"
    t.index ["user_id"], name: "index_alerms_on_user_id"
  end

  create_table "another_posts", force: :cascade do |t|
    t.string "error_type_name"
    t.string "status_error_name"
    t.string "title"
    t.text "code_content"
    t.text "other_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other_file_name"
    t.string "other_error_name"
    t.integer "file_type_id"
    t.integer "user_id", null: false
    t.boolean "confirmn", default: false
    t.integer "notice_days", default: 0
    t.index ["user_id"], name: "index_another_posts_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.integer "file_type_id"
    t.integer "notification_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_type_id"], name: "index_bookmarks_on_file_type_id"
    t.index ["notification_setting_id"], name: "index_bookmarks_on_notification_setting_id"
    t.index ["post_id"], name: "index_bookmarks_on_post_id"
    t.index ["user_id", "post_id"], name: "index_bookmarks_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "another_post_id", null: false
    t.integer "file_type_id"
    t.integer "notification_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["another_post_id"], name: "index_favorites_on_another_post_id"
    t.index ["file_type_id"], name: "index_favorites_on_file_type_id"
    t.index ["notification_setting_id"], name: "index_favorites_on_notification_setting_id"
    t.index ["user_id", "another_post_id"], name: "index_favorites_on_user_id_and_another_post_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "file_types", force: :cascade do |t|
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_settings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id"
    t.integer "file_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "check", default: false, null: false
    t.index ["file_type_id"], name: "index_notification_settings_on_file_type_id"
    t.index ["post_id"], name: "index_notification_settings_on_post_id"
    t.index ["user_id"], name: "index_notification_settings_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "save_type_name"
    t.string "title"
    t.text "code_content"
    t.text "other_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other_file_name"
    t.integer "file_type_id"
    t.integer "user_id", null: false
    t.integer "notify_days", default: 0
    t.boolean "verify", default: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "uid"
    t.string "provider"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alerms", "another_posts"
  add_foreign_key "alerms", "file_types"
  add_foreign_key "alerms", "users"
  add_foreign_key "another_posts", "users"
  add_foreign_key "bookmarks", "file_types"
  add_foreign_key "bookmarks", "notification_settings"
  add_foreign_key "bookmarks", "posts"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "favorites", "another_posts"
  add_foreign_key "favorites", "file_types"
  add_foreign_key "favorites", "notification_settings"
  add_foreign_key "favorites", "users"
  add_foreign_key "notification_settings", "file_types"
  add_foreign_key "notification_settings", "posts"
  add_foreign_key "notification_settings", "users"
  add_foreign_key "posts", "users"
end
