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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_172743) do
  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "address_line_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empleado_id", null: false
    t.index ["empleado_id"], name: "index_addresses_on_empleado_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "nacionalidad"
    t.string "estado_civil"
    t.string "dni"
    t.string "rtn"
    t.string "contrato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "developer"
    t.integer "address_id"
    t.index ["address_id"], name: "index_empleados_on_address_id"
  end

  create_table "project_assignments", force: :cascade do |t|
    t.integer "empleado_id", null: false
    t.integer "proyecto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_project_assignments_on_empleado_id"
    t.index ["proyecto_id"], name: "index_project_assignments_on_proyecto_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bitacora_del_proyecto"
    t.string "cliente"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  add_foreign_key "addresses", "empleados"
  add_foreign_key "cities", "regions"
  add_foreign_key "empleados", "addresses"
  add_foreign_key "project_assignments", "empleados"
  add_foreign_key "project_assignments", "proyectos"
  add_foreign_key "regions", "countries"
end
