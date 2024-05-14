# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_14_164955) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "petal_color"
    t.string "stem_color"
    t.integer "life_cycle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "radius_top"
    t.float "radius_bottom"
    t.float "radial_segments"
    t.float "rec_radius"
    t.float "noise_scale"
    t.float "noise_impact_x"
    t.float "noise_impact_y"
    t.float "noise_impact_z"
    t.float "shape_height"
    t.float "stem_height"
    t.float "stem_width"
    t.float "rec_position_y"
    t.float "bloom_rotation_x"
    t.float "bloom_rotation_y"
    t.float "bloom_rotation_z"
  end

  create_table "user_plants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_user_plants_on_plant_id"
    t.index ["user_id"], name: "index_user_plants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_plants", "plants"
  add_foreign_key "user_plants", "users"
end
