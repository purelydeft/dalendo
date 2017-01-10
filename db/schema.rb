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

ActiveRecord::Schema.define(version: 20170109114716) do

  create_table "badges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "badge_name"
    t.string   "badge_description"
    t.string   "badge_image"
    t.string   "badge_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_name"
    t.string   "category_description"
    t.string   "category_icon"
    t.string   "category_image"
    t.string   "category_status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "country_name"
    t.string   "nationality"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "currency_name"
    t.string   "currency_code"
    t.string   "currency_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "language_name"
    t.string   "language_code"
    t.string   "language_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "project_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.string   "fullname"
    t.string   "payment_type"
    t.string   "bankemail"
    t.string   "bankname"
    t.string   "account_number"
    t.string   "bank_ifsc_code"
    t.string   "account_type"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "project_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.integer  "commented_by"
    t.text     "comment",      limit: 65535
    t.integer  "status",                                  comment: "0=active, 1=inactive"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "project_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.string   "project_file_name"
    t.string   "project_file_type"
    t.string   "project_image_path"
    t.integer  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "project_followers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.integer  "follower_id"
    t.integer  "notification_status",              comment: "0=no, 1=yes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "project_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.integer  "liked_by"
    t.integer  "status",                  comment: "0=inactive, 1=active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.integer  "news_by"
    t.text     "news_description", limit: 65535
    t.string   "news_filename"
    t.integer  "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "project_rewards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.string   "reward_tile"
    t.integer  "reward_amount"
    t.string   "reward_description"
    t.string   "reward_shipping_details"
    t.string   "reward_estimated_delivery"
    t.string   "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "project_stories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.string   "project_video"
    t.string   "project_description"
    t.string   "project_risk"
    t.string   "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "project_supporters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.integer  "supported_by"
    t.integer  "status",                    comment: "0=inactive, 1=active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "project_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "project_id"
    t.string   "project_creator_image"
    t.string   "creator_image_status"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "structure"
    t.string   "address"
    t.integer  "country"
    t.integer  "nationality"
    t.bigint   "phonenumber"
    t.string   "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "category_id"
    t.string   "project_type"
    t.string   "project_title"
    t.string   "project_image"
    t.string   "short_desp"
    t.string   "project_location"
    t.string   "project_startdate"
    t.string   "project_enddate"
    t.string   "projectlanguage"
    t.string   "currency"
    t.integer  "project_minimum_fundinggoal"
    t.integer  "project_funding_goal"
    t.integer  "user_id"
    t.integer  "status",                                   comment: "0=pending, 1=approved, 2=disapproved, 3=inactive"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "project_location_latitude"
    t.string   "project_location_longitude"
    t.integer  "project_type_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "first_name",    limit: 65535
    t.text     "last_name",     limit: 65535
    t.text     "user_name",     limit: 65535
    t.text     "email",         limit: 65535
    t.text     "password",      limit: 65535
    t.text     "address",       limit: 65535
    t.integer  "country"
    t.text     "state",         limit: 65535
    t.text     "city",          limit: 65535
    t.text     "register_ip",   limit: 65535
    t.text     "last_login_ip", limit: 65535
    t.text     "login_type",    limit: 65535
    t.text     "facebook_id",   limit: 65535
    t.text     "google_id",     limit: 65535
    t.text     "linkedin_id",   limit: 65535
    t.text     "twitter_id",    limit: 65535
    t.text     "user_role",     limit: 65535
    t.text     "user_status",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "user_image"
    t.text     "phone_number",  limit: 65535
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "linkedin_link"
    t.string   "registercode"
  end

end
