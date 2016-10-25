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

ActiveRecord::Schema.define(version: 20161024143440) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "actionType"
    t.integer  "user_id"
    t.string   "activable_type"
    t.integer  "activable_id"
    t.integer  "tag_user_id"
    t.boolean  "seen",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["activable_type", "activable_id"], name: "index_activities_on_activable_type_and_activable_id", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "average_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password"
    t.string   "accountnumber"
    t.integer  "balance"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status",      default: 0
    t.integer  "total_price"
    t.date     "start_date"
    t.integer  "user_id"
    t.integer  "tour_id"
    t.integer  "discount_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["discount_id"], name: "index_bookings_on_discount_id", using: :btree
    t.index ["tour_id"], name: "index_bookings_on_tour_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "cover"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",             limit: 65535
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.integer  "review_id"
    t.integer  "tour_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["review_id"], name: "index_comments_on_review_id", using: :btree
    t.index ["tour_id"], name: "index_comments_on_tour_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "percent"
    t.text     "description", limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status",                    default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_id", "user_id"], name: "index_likes_on_likeable_id_and_user_id", unique: true, using: :btree
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "overall_averages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   limit: 24, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",        limit: 65535
    t.integer  "amount"
    t.integer  "classify",                     default: 0
    t.integer  "booking_id"
    t.datetime "purchased_at"
    t.string   "transaction_id"
    t.integer  "status",                       default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id", using: :btree
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "url_image"
    t.integer  "viewer",                    default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         limit: 24, null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            limit: 24, null: false
    t.integer  "qty",                       null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",                 limit: 65535
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "image"
    t.integer  "number",                                default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "cached_votes_total",                    default: 0
    t.integer  "cached_votes_score",                    default: 0
    t.integer  "cached_votes_up",                       default: 0
    t.integer  "cached_votes_down",                     default: 0
    t.integer  "cached_weighted_score",                 default: 0
    t.integer  "cached_weighted_total",                 default: 0
    t.float    "cached_weighted_average", limit: 24,    default: 0.0
    t.index ["cached_votes_down"], name: "index_reviews_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_reviews_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_reviews_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_reviews_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_reviews_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_reviews_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_reviews_on_cached_weighted_total", using: :btree
    t.index ["place_id"], name: "index_reviews_on_place_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "duration"
    t.integer  "price"
    t.text     "description", limit: 65535
    t.integer  "discount_id"
    t.integer  "place_id"
    t.integer  "category_id"
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_tours_on_category_id", using: :btree
    t.index ["discount_id"], name: "index_tours_on_discount_id", using: :btree
    t.index ["place_id"], name: "index_tours_on_place_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "is_admin",            default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "activities", "users"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "bookings", "discounts"
  add_foreign_key "bookings", "tours"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "tours"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "payments", "bookings"
  add_foreign_key "reviews", "places"
  add_foreign_key "reviews", "users"
  add_foreign_key "tours", "categories"
  add_foreign_key "tours", "discounts"
  add_foreign_key "tours", "places"
end
