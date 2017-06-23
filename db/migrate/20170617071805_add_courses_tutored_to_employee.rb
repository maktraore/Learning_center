class AddCoursesTutoredToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :courses_tutored, :string
  end
end
