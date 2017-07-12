class EmployeesSchedulesPdf < Prawn::Document
    def initialize(employees)
      super()
      # @employees = Employee.all
      # @emp_subjects = EmployeeSubject.all
      @employees = employees
      schedules
    end
    def schedules
      #   schedules_all do 
      #   row(0).font_style = :bold
      #   columns(1..3).align =  :right
      #   self.row_colors = ["dddddd", "ffffff"]
      #   self.header = true
      # end
      # text "something", size: 30
      # table([[1,2], [3,4]])

      table schedules_all
    end
    def schedules_all
      emp = []
      employee_subjects = []
      Employee.all.where(approved: true).each {|employee| emp<<  [employee.full_name, employee.timeslots.where(approved: false).map{|timeslot| [timeslot.days, timeslot.start_time, timeslot.end_time] }.join(" "),  EmployeeSubject.where(employee_id: employee.id).map{|c| c.courses_tutored}.join] }
      
        # ([["Tutor", "schedule", "Subjects/Courses"]]  + emp).schedules
        ([["Tutor", "schedule", "Subjects/Courses"]]  + emp)
        #+
        # @employees.schedules.map do |employee|
        #     [employee.full_name, employee.timeslots.first, employee.email]
        # end
        # end
    end
end

# emp = []
      # Employee.all.each {|employee| emp<<  [employee.full_name, employee.timeslots.where(approved: approved).map{|timeslot| [timeslot.days, timeslot.start_time, timeslot.end_time] }.join(" "),  EmployeeSubject.where(employee_id: 103).map{|c| c.courses_tutored}.join] }