class ChangeEmployeeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:employees, :admin, :false)
    change_column :timeslots, :date, :string
  end
end
