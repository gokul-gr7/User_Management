class CreateLandmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :landmarks do |t|
      t.string :Door_number
      t.string :Floor_number
      t.string :Building_name
      t.string :Street_name
      t.string :Area
      t.string :Post
      t.string :village
      t.string :Pincode
      t.string :Landmark
      t.string :City
      t.string :District
      t.string :State
      t.string :Country
      t.string :Continent
      t.string :Current_address

      t.timestamps
    end
  end
end
