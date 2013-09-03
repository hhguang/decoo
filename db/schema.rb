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

ActiveRecord::Schema.define(:version => 20130903073818) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "bh"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "memo"
  end

  create_table "goods_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "limit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goods_stock_items", :force => true do |t|
    t.integer  "goods_stock_id"
    t.string   "act_type"
    t.integer  "user_id"
    t.text     "memo"
    t.integer  "quantity"
    t.integer  "store_house_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "goods_stocks", :force => true do |t|
    t.string   "name",                             :null => false
    t.integer  "quantity",          :default => 0
    t.string   "bh",                               :null => false
    t.text     "memo"
    t.integer  "store_house_id"
    t.integer  "goods_category_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "supplier"
  end

  create_table "house_stocks", :force => true do |t|
    t.integer  "goods_stock_id",                :null => false
    t.integer  "store_house_id",                :null => false
    t.integer  "quantity",       :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "in_stock_items", :force => true do |t|
    t.integer  "in_stock_id"
    t.integer  "product_id"
    t.integer  "color_id"
    t.decimal  "weight"
    t.integer  "quantity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "memo"
    t.integer  "spec_id"
    t.integer  "user_id"
    t.string   "spec_bh"
  end

  create_table "in_stocks", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "outstock_items", :force => true do |t|
    t.string   "spec_bh"
    t.integer  "spec_id"
    t.integer  "product_id"
    t.integer  "outstock_id"
    t.decimal  "weight"
    t.integer  "quantity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "outstocks", :force => true do |t|
    t.string   "bh"
    t.integer  "user_id"
    t.text     "memo"
    t.string   "taker"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "porder_id"
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.integer  "toy_id"
    t.integer  "quantity"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parts", :force => true do |t|
    t.integer  "package_id"
    t.integer  "toy_id"
    t.integer  "spec_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "porder_items", :force => true do |t|
    t.integer  "part_id"
    t.integer  "quantity"
    t.integer  "porder_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "spec_id"
  end

  create_table "porders", :force => true do |t|
    t.string   "name"
    t.integer  "toy_id"
    t.integer  "quantity"
    t.integer  "user_id"
    t.integer  "outstock_id"
    t.text     "memo"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_out",      :default => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "image_url"
    t.string   "bh"
    t.decimal  "weight"
    t.integer  "color_id"
    t.text     "memo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spec_properties", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specs", :force => true do |t|
    t.integer  "product_id"
    t.string   "bh"
    t.string   "name"
    t.integer  "color_id"
    t.string   "material"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "memo"
  end

  create_table "stocks", :force => true do |t|
    t.string   "bh"
    t.string   "name"
    t.string   "color_name"
    t.integer  "color_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "spec_id"
    t.decimal  "weight"
  end

  create_table "store_houses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "default",    :default => false
  end

  create_table "toys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "photo"
    t.string   "title"
  end

  create_table "user_logs", :force => true do |t|
    t.integer  "user_id"
    t.string   "ctr_name"
    t.string   "action_name"
    t.integer  "resource_id"
    t.string   "resource_name"
    t.text     "description"
    t.string   "remote_ip"
    t.string   "url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => ""
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "name",                   :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "disabled",               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
