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

ActiveRecord::Schema.define(version: 20150506205652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.boolean  "active"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["company_id"], name: "index_accounts_on_company_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "transaction_type"
  end

  add_index "categories", ["company_id"], name: "index_categories_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.integer  "amount"
    t.text     "description"
    t.boolean  "active"
    t.date     "date"
    t.integer  "company_id"
    t.integer  "project_id"
    t.integer  "category_id"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.integer  "recurrence"
    t.date     "end_date"
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id", using: :btree
  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id", using: :btree
  add_index "expenses", ["company_id"], name: "index_expenses_on_company_id", using: :btree
  add_index "expenses", ["project_id"], name: "index_expenses_on_project_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.integer  "amount"
    t.text     "description"
    t.boolean  "active"
    t.date     "date"
    t.integer  "company_id"
    t.integer  "project_id"
    t.integer  "category_id"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "recurrence"
    t.string   "name"
    t.date     "end_date"
  end

  add_index "incomes", ["account_id"], name: "index_incomes_on_account_id", using: :btree
  add_index "incomes", ["category_id"], name: "index_incomes_on_category_id", using: :btree
  add_index "incomes", ["company_id"], name: "index_incomes_on_company_id", using: :btree
  add_index "incomes", ["project_id"], name: "index_incomes_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree

  create_table "recurrent_expenses", force: :cascade do |t|
    t.string   "recurrent_hash"
    t.integer  "expense_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "recurrent_expenses", ["expense_id"], name: "index_recurrent_expenses_on_expense_id", using: :btree

  create_table "recurrent_incomes", force: :cascade do |t|
    t.string   "recurrent_hash"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "income_id"
  end

  add_index "recurrent_incomes", ["income_id"], name: "index_recurrent_incomes_on_income_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "accounts", "companies"
  add_foreign_key "categories", "companies"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "companies"
  add_foreign_key "expenses", "projects"
  add_foreign_key "incomes", "accounts"
  add_foreign_key "incomes", "categories"
  add_foreign_key "incomes", "companies"
  add_foreign_key "incomes", "projects"
  add_foreign_key "projects", "companies"
  add_foreign_key "recurrent_expenses", "expenses"
  add_foreign_key "recurrent_incomes", "incomes"
end
