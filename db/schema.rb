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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_162832) do
  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "address_line_1"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_addresses_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "nacionalidad"
    t.string "estado_civil"
    t.string "dni"
    t.string "rtn"
    t.string "contrato"
    t.string "developer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "serial_number"
    t.string "status"
    t.date "entry_date"
    t.string "lynx_id_number"
    t.integer "purchase_price"
    t.integer "current_cost"
    t.date "warranty_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "cliente"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.string "bitacora_del_proyecto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.date "date_of_assignment"
    t.date "date_of_extraction"
    t.text "equipment_log"
    t.string "assigned_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "employees"
end
