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

ActiveRecord::Schema[8.1].define(version: 2026_01_07_072319) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "certificates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.binary "pdf_data"
    t.string "pdf_hash"
    t.datetime "updated_at", null: false
  end

  create_table "path_infos", force: :cascade do |t|
    t.string "certificate_name"
    t.datetime "created_at", null: false
    t.text "extended_desc"
    t.bigint "path_id"
    t.datetime "updated_at", null: false
    t.index ["path_id"], name: "index_path_infos_on_path_id"
  end

  create_table "paths", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_paths_on_user_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "course_five"
    t.string "course_four"
    t.string "course_one"
    t.string "course_three"
    t.string "course_two"
    t.datetime "created_at", null: false
    t.bigint "path_info_id"
    t.decimal "rating_five", precision: 3, scale: 3
    t.decimal "rating_four", precision: 3, scale: 3
    t.decimal "rating_one", precision: 3, scale: 3
    t.decimal "rating_three", precision: 3, scale: 3
    t.decimal "rating_two", precision: 3, scale: 3
    t.datetime "updated_at", null: false
    t.index ["path_info_id"], name: "index_roadmaps_on_path_info_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "full_name"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "path_infos", "paths"
  add_foreign_key "paths", "users"
  add_foreign_key "roadmaps", "path_infos"
end
