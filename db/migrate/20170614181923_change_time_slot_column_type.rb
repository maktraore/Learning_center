class ChangeTimeSlotColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :timeslots, :date, :string
  end
end
