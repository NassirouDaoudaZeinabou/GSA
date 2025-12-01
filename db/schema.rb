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

ActiveRecord::Schema[8.0].define(version: 2025_11_27_100802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "matricule"
    t.decimal "budget_sante"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_agents_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.decimal "budget_total_alloue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "nom"
    t.string "type_etablissement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sous_clients", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "relation"
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_sous_clients_on_agent_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "montant"
    t.string "type_transaction"
    t.date "date"
    t.bigint "agent_id", null: false
    t.bigint "sous_client_id", null: false
    t.bigint "etablissement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_transactions_on_agent_id"
    t.index ["etablissement_id"], name: "index_transactions_on_etablissement_id"
    t.index ["sous_client_id"], name: "index_transactions_on_sous_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agents", "clients"
  add_foreign_key "sous_clients", "agents"
  add_foreign_key "transactions", "agents"
  add_foreign_key "transactions", "etablissements"
  add_foreign_key "transactions", "sous_clients"
end
