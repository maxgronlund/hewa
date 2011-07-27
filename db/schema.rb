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

ActiveRecord::Schema.define(:version => 20110727144818) do

  create_table "addresses", :force => true do |t|
    t.string   "send_to"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "user_country"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helps", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   :default => 1
  end

  create_table "news_blogs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.integer  "product_id"
    t.integer  "language_id",                               :default => 1
    t.decimal  "price",       :precision => 8, :scale => 2
    t.integer  "quantity",                                  :default => 1
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["product_id"], :name => "index_prices_on_product_id"

  create_table "product_lines", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "crop_params",           :limit => 1024
    t.boolean  "promote_on_front_page",                 :default => true
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.string   "crop_params",     :limit => 1024
    t.integer  "product_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_nr"
    t.decimal  "price",                           :precision => 8, :scale => 2
    t.integer  "min_units"
    t.integer  "quantity",                                                      :default => 1
    t.boolean  "active"
  end

  add_index "products", ["product_line_id"], :name => "index_products_on_product_line_id"

  create_table "screen_casts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_contents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identity"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                  :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128,  :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role"
    t.string   "image"
    t.string   "crop_params",            :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "monday",                                 :default => true
    t.boolean  "tuesday",                                :default => true
    t.boolean  "wednesday",                              :default => true
    t.boolean  "thursday",                               :default => true
    t.boolean  "friday",                                 :default => true
    t.boolean  "grid"
    t.boolean  "show_on_about_page",                     :default => false
    t.text     "cv"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
