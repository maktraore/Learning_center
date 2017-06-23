class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :semester
      t.boolean :approved

      t.timestamps
    end
  end
end
