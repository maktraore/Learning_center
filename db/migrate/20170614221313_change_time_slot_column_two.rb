class ChangeTimeSlotColumnTwo < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :location_id, :integer
  end
end
