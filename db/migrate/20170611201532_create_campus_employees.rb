class CreateCampusEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :campus_employees do |t|
      t.integer :employee_id
      t.integer :campus_id

      t.timestamps
    end
  end
end
