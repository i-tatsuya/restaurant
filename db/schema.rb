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

ActiveRecord::Schema.define(:version => 20131223083613) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "contents"
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_imgs", :force => true do |t|
    t.integer  "course_id",    :null => false
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "course_imgs", ["course_id"], :name => "index_course_imgs_on_course_id"

  create_table "courses", :force => true do |t|
    t.string   "course_name"
    t.integer  "price"
    t.string   "details"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "courses", ["id"], :name => "index_courses_on_id"

  create_table "memorial_has_services", :force => true do |t|
    t.integer  "memorial_id", :null => false
    t.integer  "service_id",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "memorials", :force => true do |t|
    t.string   "memorial_id"
    t.string   "memorial_name"
    t.float    "memorial_rate"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.date     "date",        :null => false
    t.integer  "time",        :null => false
    t.integer  "persons",     :null => false
    t.integer  "course_id",   :null => false
    t.text     "message"
    t.integer  "service_id"
    t.integer  "memorial_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reservations", ["course_id"], :name => "index_reservations_on_course_id"
  add_index "reservations", ["date"], :name => "date_index"
  add_index "reservations", ["id"], :name => "id_index", :unique => true
  add_index "reservations", ["memorial_id"], :name => "index_reservations_on_memorial_id"
  add_index "reservations", ["service_id"], :name => "index_reservations_on_service_id"
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "seats", :force => true do |t|
    t.integer  "number"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "selected_seats", :force => true do |t|
    t.integer  "reservation_id"
    t.integer  "seat_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "selected_seats", ["reservation_id"], :name => "index_selected_seats_on_reservation_id"
  add_index "selected_seats", ["seat_id"], :name => "index_selected_seats_on_seat_id"

  create_table "services", :force => true do |t|
    t.integer  "service_number"
    t.string   "service_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name",                          :null => false
    t.string   "hashed_password",                    :null => false
    t.string   "address",                            :null => false
    t.string   "mail_address",                       :null => false
    t.string   "phone_number",                       :null => false
    t.date     "birthday",                           :null => false
    t.boolean  "administrator",   :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["user_name"], :name => "index_users_on_user_name"

end
