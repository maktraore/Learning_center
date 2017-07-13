class AddEmployeeIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :employee_id, :integer
  end
end
