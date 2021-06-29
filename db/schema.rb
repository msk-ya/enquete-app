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

ActiveRecord::Schema.define(version: 2021_06_28_133652) do

  create_table "enquetes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "limit"
  end

  create_table "forms", force: :cascade do |t|
    t.text "html"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.integer "form_type", default: 0
    t.index ["question_id"], name: "index_forms_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "enquete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enquete_id"], name: "index_questions_on_enquete_id"
  end

  create_table "results", force: :cascade do |t|
    t.text "text_title"
    t.text "select_title"
    t.text "content"
    t.text "select"
    t.text "form_types"
    t.integer "enquete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enquete_id"], name: "index_results_on_enquete_id"
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
    t.string "area"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
