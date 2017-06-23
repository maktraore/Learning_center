class ChangeCampusIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :campus_employees, :campus_id, :location_id
  end
end
