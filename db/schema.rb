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

ActiveRecord::Schema.define(:version => 20130326144126) do

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "bh"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "memo"
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
  end

end
