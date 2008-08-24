# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080824151644) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_vectors", :id => false, :force => true do |t|
    t.integer "category_id", :limit => 11
    t.integer "vector_id",   :limit => 11
  end

  create_table "comments", :force => true do |t|
    t.integer  "vector_id",  :limit => 11
    t.string   "user_id"
    t.text     "body"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "vector_id",        :limit => 11
    t.integer  "numerical_rating", :limit => 11
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", :force => true do |t|
    t.integer  "primary_category_id",   :limit => 11
    t.integer  "secondary_category_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories_vectors", :id => false, :force => true do |t|
    t.integer "sub_category_id", :limit => 11
    t.integer "vector_id",       :limit => 11
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "email"
    t.string   "ip"
    t.string   "url"
    t.text     "bio"
    t.boolean  "admin",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vectors", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "license_id", :limit => 11
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
