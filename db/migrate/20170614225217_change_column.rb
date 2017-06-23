class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :campus_subjects, :campus_id, :location_id
  end
end
