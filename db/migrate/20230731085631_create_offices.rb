class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :Company
      t.string :Role
      t.string :Employee_id
      t.string :Employee
      t.string :mail_id
      t.string :Laptop_serial
      t.string :Laptop_mode
      t.string :Laptop_Brand
      t.string :Laptop_Mac
      t.string :Hoodies
      t.string :Experience
      t.string :Account_number
      t.string :Bank_name
      t.string :Branch
      t.string :IFSC_code
      t.string :Account_holder

      t.timestamps
    end
  end
end
