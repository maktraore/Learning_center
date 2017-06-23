class ChangeTimeSlotColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :timeslots, :date, :days
  end
end
