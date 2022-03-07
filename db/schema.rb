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

ActiveRecord::Schema.define(version: 2022_03_06_041853) do

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.integer "child_id"
    t.integer "caregiver_id"
    t.integer "event_task_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_addresses_on_caregiver_id"
    t.index ["child_id"], name: "index_addresses_on_child_id"
    t.index ["event_id"], name: "index_addresses_on_event_id"
    t.index ["event_task_id"], name: "index_addresses_on_event_task_id"
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.string "email"
    t.integer "event_id"
    t.integer "event_task_id"
    t.integer "child_id"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_caregivers_on_address_id"
    t.index ["child_id"], name: "index_caregivers_on_child_id"
    t.index ["event_id"], name: "index_caregivers_on_event_id"
    t.index ["event_task_id"], name: "index_caregivers_on_event_task_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.integer "event_id"
    t.integer "event_task_id"
    t.integer "caregiver_id"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_children_on_address_id"
    t.index ["caregiver_id"], name: "index_children_on_caregiver_id"
    t.index ["event_id"], name: "index_children_on_event_id"
    t.index ["event_task_id"], name: "index_children_on_event_task_id"
  end

  create_table "event_tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "end_time"
    t.string "priority"
    t.string "status"
    t.integer "event_id", null: false
    t.integer "child_id", null: false
    t.integer "caregiver_id"
    t.integer "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.integer "pickup_address"
    t.integer "dropoff_address"
    t.index ["address_id"], name: "index_event_tasks_on_address_id"
    t.index ["caregiver_id"], name: "index_event_tasks_on_caregiver_id"
    t.index ["child_id"], name: "index_event_tasks_on_child_id"
    t.index ["event_id"], name: "index_event_tasks_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "child_id", null: false
    t.integer "caregiver_id"
    t.integer "event_task_id"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["caregiver_id"], name: "index_events_on_caregiver_id"
    t.index ["child_id"], name: "index_events_on_child_id"
    t.index ["event_task_id"], name: "index_events_on_event_task_id"
  end

  add_foreign_key "addresses", "caregivers"
  add_foreign_key "addresses", "children"
  add_foreign_key "addresses", "event_tasks"
  add_foreign_key "addresses", "events"
  add_foreign_key "caregivers", "addresses"
  add_foreign_key "caregivers", "children"
  add_foreign_key "caregivers", "event_tasks"
  add_foreign_key "caregivers", "events"
  add_foreign_key "children", "addresses"
  add_foreign_key "children", "caregivers"
  add_foreign_key "children", "event_tasks"
  add_foreign_key "children", "events"
  add_foreign_key "event_tasks", "addresses"
  add_foreign_key "event_tasks", "caregivers"
  add_foreign_key "event_tasks", "children"
  add_foreign_key "event_tasks", "events"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "caregivers"
  add_foreign_key "events", "children"
  add_foreign_key "events", "event_tasks"
end
