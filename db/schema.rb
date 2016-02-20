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

ActiveRecord::Schema.define(version: 20160220190911) do

  create_table "alumnos", force: :cascade do |t|
    t.string   "apellido"
    t.string   "nombre"
    t.string   "documento"
    t.string   "domicilio"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.string   "telefonoContacto"
    t.string   "observaciones"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "activo",            default: true
    t.integer  "tipo_documento_id"
  end

  add_index "alumnos", ["tipo_documento_id"], name: "index_alumnos_on_tipo_documento_id"

  create_table "profesors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "documento"
    t.string   "email"
    t.string   "celular"
    t.decimal  "comision"
    t.decimal  "sueldo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_documento", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
