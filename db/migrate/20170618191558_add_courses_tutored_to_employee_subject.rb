class AddCoursesTutoredToEmployeeSubject < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :courses_tutored, :string
  end
end
