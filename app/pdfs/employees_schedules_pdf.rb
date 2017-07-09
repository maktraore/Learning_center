class EmployeesSchedulesPdf < Prawn::Document
    def initialize
      super
      @employees = Employee.all
      @emp_subjects = EmployeeSubject.all
      schedules
    end
    def schedules
       schedules_all do 
        row(0).font_style = :bold
        columns(1..3).align =  :right
        self.row_colors = ["dddddd", "ffffff"]
        self.header = true
      end
    end
    def schedules_all
        [["Tutor", "schedule", "Subjects/Courses"]]
        @employees.map do |employee|
          [employee.full_name, employee.timeslots, employee.email]
        end
    end
end