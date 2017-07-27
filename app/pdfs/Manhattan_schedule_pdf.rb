class ManhattanSchedulePdf < Prawn::Document

    def initialize(employees)
      super()
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
        columns(0).width = 100
        columns(3).width = 130
        columns(1).width = 220
        self.row_colors = ["dddddd", "ffffff"]
        self.header = true
      end
   
    end
    def schedules_all
      emp = []
      employee_subjects = []
      Employee.all.joins(:locations).where('locations.name = ?', "Manhattan").where(approved: true).each {|employee| 
        emp<<  [employee.full_name , employee.timeslots.where(approved: true).where(location_id:1).map{|timeslot| [timeslot.days, timeslot.start_time, timeslot.end_time].join(" ")  }.join("\n "),  
        employee.locations.where(name: "Manhattan").map{|location| location.name}.join(" "),
        EmployeeSubject.where(employee_id: employee.id).map{|c| c.courses_tutored}.join(" ") ]}
    
        ([["Tutors", "schedule", "Campus", "Subjects/Courses"]]  + emp)
      
    end

end