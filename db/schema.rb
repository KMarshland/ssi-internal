# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160502001315) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name"

  create_table "companies_groups", force: :cascade do |t|
    t.integer "company_id"
    t.integer "group_id"
  end

  add_index "companies_groups", ["company_id", "group_id"], name: "index_companies_groups_on_company_id_and_group_id"
  add_index "companies_groups", ["company_id"], name: "index_companies_groups_on_company_id"
  add_index "companies_groups", ["group_id"], name: "index_companies_groups_on_group_id"

  create_table "file_uploads", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.string   "uri"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "file_uploads", ["name"], name: "index_file_uploads_on_name"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name"

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id"
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id"

  create_table "reimbursements", force: :cascade do |t|
    t.string   "status"
    t.string   "team"
    t.boolean  "credit_card"
    t.decimal  "value",       precision: 8, scale: 2
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "reimbursements", ["status"], name: "index_reimbursements_on_status"
  add_index "reimbursements", ["team"], name: "index_reimbursements_on_team"

  create_table "resume_exports", force: :cascade do |t|
    t.string   "link"
    t.string   "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resume_exports", ["link"], name: "index_resume_exports_on_link"

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "primary_resume_id"
  end

  add_index "users", ["primary_resume_id"], name: "index_users_on_primary_resume_id"

end
