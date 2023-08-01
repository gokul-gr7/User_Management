class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :Company
      t.string :Role
      t.string :Employee_id
      t.string :Employee
      t.string :mail_id

      t.timestamps
    end
  end
end
