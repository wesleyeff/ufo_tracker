# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_29_204718) do

  create_table "hotspots", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotspots_sightings", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "hotspot_id", null: false
    t.bigint "sighting_id", null: false
    t.index ["hotspot_id", "sighting_id"], name: "index_hotspots_sightings_on_hotspot_id_and_sighting_id"
    t.index ["sighting_id", "hotspot_id"], name: "index_hotspots_sightings_on_sighting_id_and_hotspot_id"
  end

  create_table "sightings", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "sighted_at"
    t.float "latitude"
    t.float "longitude"
    t.text "shape"
    t.integer "duration_seconds"
    t.text "comments"
    t.text "city"
    t.text "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
