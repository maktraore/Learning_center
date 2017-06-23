class AddCoursesTutoredToEmployeeSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_subjects, :courses_tutored, :string
  end
end
