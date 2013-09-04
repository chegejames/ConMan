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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130904203912) do

  create_table "material_procurements", :force => true do |t|
    t.integer  "project_id"
    t.integer  "material_id"
    t.date     "date"
    t.float    "quantity"
    t.float    "price_per_unit"
    t.float    "total"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "material_procurements", ["material_id"], :name => "index_material_procurements_on_material_id"

  create_table "material_usages", :force => true do |t|
    t.integer  "project_id"
    t.integer  "material_id"
    t.date     "date"
    t.float    "quantity"
    t.integer  "phase_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "material_usages", ["material_id"], :name => "index_material_usages_on_material_id"
  add_index "material_usages", ["phase_id"], :name => "index_material_usages_on_phase_id"
  add_index "material_usages", ["project_id"], :name => "index_material_usages_on_project_id"

  create_table "materials", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "units_of_measurement"
    t.float    "lowest_estimated_units"
    t.float    "highest_estimated_units"
    t.float    "actual_units"
    t.float    "lowest_estimated_cost_per_unit"
    t.float    "highest_estimated_cost_per_unit"
    t.float    "average_cost_per_unit"
    t.float    "balance_units"
    t.float    "total_cost"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "materials", ["project_id"], :name => "index_materials_on_project_id"

  create_table "phases", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.date     "estimated_start_date"
    t.date     "actual_start_date"
    t.date     "estimated_completion_date"
    t.date     "actual_completion_date"
    t.float    "lowest_estimated_cost"
    t.float    "highest_estimated_cost"
    t.float    "actual_cost"
    t.float    "completion_pct"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "phases", ["project_id"], :name => "index_phases_on_project_id"

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "location"
    t.date     "start_date"
    t.date     "estimated_completion_date"
    t.float    "budget_amount"
    t.float    "spent_amount"
    t.float    "balance_amount"
    t.float    "completion_pct"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "service_procurements", :force => true do |t|
    t.integer  "project_id"
    t.integer  "service_id"
    t.integer  "phase_id"
    t.string   "provider"
    t.date     "date"
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "service_procurements", ["phase_id"], :name => "index_service_procurements_on_phase_id"
  add_index "service_procurements", ["project_id"], :name => "index_service_procurements_on_project_id"
  add_index "service_procurements", ["service_id"], :name => "index_service_procurements_on_service_id"

  create_table "services", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.float    "lowest_estimated_number_of_services"
    t.float    "highest_estimated_number_of_services"
    t.float    "actual_number"
    t.float    "lowest_estimated_cost_per_service"
    t.float    "highest_estimated_cost_per_service"
    t.float    "avg_cost_per_service"
    t.float    "total_cost"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "services", ["project_id"], :name => "index_services_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
