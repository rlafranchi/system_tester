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

ActiveRecord::Schema.define(version: 20170513214722) do

  create_table "tude_tester_features", force: :cascade do |t|
    t.string "title"
  end

  create_table "tude_tester_scenario_steps", force: :cascade do |t|
    t.integer "position"
    t.integer "tude_tester_step_id"
    t.integer "tude_tester_scenario_id"
    t.index ["tude_tester_scenario_id"], name: "index_tude_tester_scenario_steps_on_tude_tester_scenario_id"
    t.index ["tude_tester_step_id"], name: "index_tude_tester_scenario_steps_on_tude_tester_step_id"
  end

  create_table "tude_tester_scenarios", force: :cascade do |t|
    t.string "title"
    t.integer "tude_tester_feature_id"
    t.index ["tude_tester_feature_id"], name: "index_tude_tester_scenarios_on_tude_tester_feature_id"
  end

  create_table "tude_tester_steps", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.string "arg_one"
    t.string "arg_two"
  end

end
