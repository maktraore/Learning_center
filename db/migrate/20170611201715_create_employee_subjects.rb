class CreateEmployeeSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_subjects do |t|
      t.integer :employee_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
