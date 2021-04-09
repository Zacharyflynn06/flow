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

ActiveRecord::Schema.define(version: 2021_04_09_173351) do

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "level"
    t.string "day"
    t.time "time"
    t.integer "duration"
    t.decimal "price"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_klasses_on_student_id"
    t.index ["teacher_id"], name: "index_klasses_on_teacher_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "klass_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["klass_id"], name: "index_reviews_on_klass_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "years_experience"
    t.text "bio"
    t.integer "role"
    t.string "password_digest"
    t.integer "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "klasses", "users", column: "student_id"
  add_foreign_key "klasses", "users", column: "teacher_id"
  add_foreign_key "reviews", "klasses"
  add_foreign_key "reviews", "users", column: "student_id"
end
