class AddEmployeeIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :employee_id, :integer
  end
end
