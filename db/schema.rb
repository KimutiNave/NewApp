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

ActiveRecord::Schema[7.0].define(version: 2024_01_22_143312) do
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
  end

  create_table "file_types", force: :cascade do |t|
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "save_type_name"
    t.string "title"
    t.text "code_content"
    t.text "other_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other_file_name"
  end

end
