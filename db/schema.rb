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

ActiveRecord::Schema[7.0].define(version: 2023_07_31_093856) do
  create_table "details", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "Email"
    t.string "phone"
    t.string "school"
    t.string "tenth_percentage"
    t.string "hsc_percentage"
    t.string "college"
    t.string "cgpa"
    t.string "aadhaar"
    t.string "pan"
    t.string "profession"
    t.string "instagram"
    t.string "facebook"
    t.string "twitter"
    t.string "thread"
    t.string "whatsapp"
    t.string "fatherName"
    t.string "MotherName"
    t.string "Fathercontact"
    t.string "MotherContact"
    t.string "Marital"
    t.string "FavColor"
    t.string "DOB"
    t.string "nickName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landmarks", force: :cascade do |t|
    t.string "Door_number"
    t.string "Floor_number"
    t.string "Building_name"
    t.string "Street_name"
    t.string "Area"
    t.string "Post"
    t.string "village"
    t.string "Pincode"
    t.string "Landmark"
    t.string "City"
    t.string "District"
    t.string "State"
    t.string "Country"
    t.string "Continent"
    t.string "Current_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "livings", force: :cascade do |t|
    t.string "Door_number"
    t.string "Floor_number"
    t.string "Building_name"
    t.string "Street_name"
    t.string "Area"
    t.string "Post"
    t.string "village"
    t.string "Pincode"
    t.string "Landmark"
    t.string "City"
    t.string "District"
    t.string "State"
    t.string "Country"
    t.string "Continent"
    t.string "Current_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "Company"
    t.string "Role"
    t.string "Employee_id"
    t.string "Employee"
    t.string "mail_id"
    t.string "Laptop_serial"
    t.string "Laptop_mode"
    t.string "Laptop_Brand"
    t.string "Laptop_Mac"
    t.string "Hoodies"
    t.string "Experience"
    t.string "Account_number"
    t.string "Bank_name"
    t.string "Branch"
    t.string "IFSC_code"
    t.string "Account_holder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
