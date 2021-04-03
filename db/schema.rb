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

ActiveRecord::Schema.define(version: 2021_04_03_072417) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_klasses", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "klass_id", null: false
    t.index ["category_id", "klass_id"], name: "index_categories_klasses_on_category_id_and_klass_id"
    t.index ["klass_id", "category_id"], name: "index_categories_klasses_on_klass_id_and_category_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.integer "length"
    t.integer "price"
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_klasses_on_student_id"
    t.index ["teacher_id"], name: "index_klasses_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "years_experience"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "klasses", "students"
  add_foreign_key "klasses", "teachers"
end
