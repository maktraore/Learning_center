class EmployeesSchedulesPdf < Prawn::Document
    def initialize(employees)
      super()
      # @employees = Employee.all
      # @emp_subjects = EmployeeSubject.all
      @employees = employees
      schedules
    end
    def schedules
        move_down 20
        table schedules_all do 
        row(0).font_style = :bold
        # columns(3).row_span = 2
        columns(1..3).align =  :left
        rows(1).align = :justify
        self.row_colors = ["dddddd", "ffffff"]
        self.header = true
      end
      # text "something", size: 30
      # table([[1,2], [3,4]])

      # table schedules_all
    end
    def schedules_all
      emp = []
      employee_subjects = []
      Employee.all.where(approved: true).each {|employee| 
        emp<<  [employee.full_name, employee.timeslots.where(approved: false).map{|timeslot| [timeslot.days, timeslot.start_time, timeslot.end_time
       ].join(" ")}.join("\n "), 
        employee.locations.map{|location| location.name }.join("\n "),
          EmployeeSubject.where(employee_id: employee.id).map{|c| c.courses_tutored}.join(" ")] }
    
        [["Tutors", "schedule", "Campus", "Subjects/Courses"]]  + emp
      
    end
end
