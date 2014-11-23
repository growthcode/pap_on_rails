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

ActiveRecord::Schema.define(:version => 20141123013808) do

  create_table "pap_actions", :force => true do |t|
    t.string   "acting_person_title"
    t.string   "acting_person"
    t.string   "action_statement"
    t.text     "description"
    t.integer  "priority"
    t.integer  "position"
    t.string   "state_of_action"
    t.integer  "project_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "pap_actions", ["acting_person"], :name => "index_pap_actions_on_acting_person"
  add_index "pap_actions", ["acting_person_title"], :name => "index_pap_actions_on_acting_person_title"
  add_index "pap_actions", ["position"], :name => "index_pap_actions_on_position"
  add_index "pap_actions", ["priority"], :name => "index_pap_actions_on_priority"
  add_index "pap_actions", ["project_id"], :name => "index_pap_actions_on_project_id"
  add_index "pap_actions", ["state_of_action"], :name => "index_pap_actions_on_state_of_action"

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "position"
  end

  add_index "projects", ["project_name"], :name => "index_projects_on_project_name"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["organization"], :name => "index_users_on_organization"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
