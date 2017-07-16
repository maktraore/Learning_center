class AddEmployeeIdToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :employee_id, :integer
  end
end
