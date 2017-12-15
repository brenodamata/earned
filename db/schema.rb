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

ActiveRecord::Schema.define(version: 20171215022349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daylogs", force: :cascade do |t|
    t.integer "date_code"
    t.integer "incentive_total"
    t.integer "strikes"
    t.boolean "win"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demerits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incentives", force: :cascade do |t|
    t.bigint "metric_id"
    t.boolean "merit"
    t.integer "threshold"
    t.string "equation"
    t.integer "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_incentives_on_metric_id"
  end

  create_table "metric_logs", force: :cascade do |t|
    t.bigint "metric_id"
    t.integer "log_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_metric_logs_on_metric_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name"
    t.string "unit_of_measure"
    t.integer "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.bigint "demerit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["demerit_id"], name: "index_rules_on_demerit_id"
  end

  create_table "weeklogs", force: :cascade do |t|
    t.integer "start_date_code"
    t.integer "end_date_code"
    t.integer "weekly_incentive"
    t.integer "incentive_total"
    t.integer "wins"
    t.integer "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "incentives", "metrics"
  add_foreign_key "metric_logs", "metrics"
  add_foreign_key "rules", "demerits"
end
