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

ActiveRecord::Schema[7.0].define(version: 2022_08_02_211404) do
  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quizz_id"
    t.integer "index"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "quizz_id"
    t.integer "user_id"
    t.integer "score"
    t.boolean "passed"
    t.integer "grade"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'String' for column 'username'

  add_foreign_key "questions", "quizzes", column: "quizz_id"
  add_foreign_key "scores", "quizzes", column: "quizz_id"
  add_foreign_key "scores", "users"
end
