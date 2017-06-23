class AddApprovedToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :approved, :boolean, :default=> :false
  end
end
