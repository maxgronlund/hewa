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

ActiveRecord::Schema.define(:version => 20110703120240) do

  create_table "product_lines", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "crop_params", :limit => 1024
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.string   "crop_params",     :limit => 1024
    t.integer  "product_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["product_line_id"], :name => "index_products_on_product_line_id"

  create_table "text_contents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identity"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "role"
    t.integer  "sign_in_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "crop_params",     :limit => 1024
  end

end
