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

ActiveRecord::Schema.define(version: 2021_08_30_033739) do

  create_table "applicants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "profile_photo", null: false
    t.timestamp "dob"
    t.bigint "phone_no1", null: false
    t.string "phone_no2"
    t.string "email"
    t.string "current_address", null: false
    t.string "hometown_address"
    t.string "bachelor_university"
    t.string "bachelor_year"
    t.string "bachelor_degree"
    t.string "master_university"
    t.string "master_year"
    t.string "master_degree"
    t.string "diploma_name"
    t.string "certificate"
    t.text "programming"
    t.text "english"
    t.text "japanese"
    t.text "other"
    t.text "internship_info"
    t.text "job_experience"
    t.integer "total_exp_year"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_upload"
  end

end
