class CreateEmployeeTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_time_slots do |t|
      t.integer :timeslot_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
