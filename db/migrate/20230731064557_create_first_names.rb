class CreateFirstNames < ActiveRecord::Migration[7.0]
  def change
    create_table :first_names do |t|
      t.string :lastName
      t.string :Email
      t.string :phone
      t.string :school
      t.string :10th_percentage
      t.string :12th_percentage
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
