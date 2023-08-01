class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :firstName
      t.string :lastName
      t.string :Email
      t.string :phone
      t.string :school
      t.string :tenth_percentage
      t.string :hsc_percentage
      t.string :college
      t.string :cgpa
      t.string :aadhaar
      t.string :pan
      t.string :profession
      t.string :instagram
      t.string :facebook
      t.string :twitter
      t.string :thread
      t.string :whatsapp
      t.string :fatherName
      t.string :MotherName
      t.string :Fathercontact
      t.string :MotherContact
      t.string :Marital
      t.string :FavColor
      t.string :DOB
      t.string :nickName

      t.timestamps
    end
  end
end
