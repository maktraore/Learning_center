class RemoveImageFromEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :image, :string
  end
end
