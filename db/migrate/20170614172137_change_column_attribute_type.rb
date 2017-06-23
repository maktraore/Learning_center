class ChangeColumnAttributeType < ActiveRecord::Migration[5.0]
  def change
    change_column :timeslots, :start_time, :string
    change_column :timeslots, :end_time, :string
    change_column_default(:timeslots, :approved, :false)
    change_column_default(:employees, :admin, :false)
  end
end
