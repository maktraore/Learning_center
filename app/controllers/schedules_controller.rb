  class SchedulesController < ApplicationController
      def index
          @employee = Employee.find_by(id:params[:employee_id])
        @locations = Location.all
        @semesters = ["fall","spring", "summer", "other"]
      end
      def edit
        @employee= Employee.find_by(id: params[:employee_id])
        @locations = @employee.locations
        @semesters = ["fall","spring", "summer", "other"]
        @timeslots = @employee.timeslots
        @employee_subject = EmployeeSubject.find_by(id: params[:id])
      end

      def new 
        @employee = Employee.find_by(id:params[:employee_id])
        @locations = Location.all
        @semesters = ["fall","spring", "summer", "other"]
      end

      def show
      end

      def update
          @semesters = ["fall","spring", "summer", "other"]
          @employee = Employee.find_by(id:params[:employee_id])
           employee_timeslot = EmployeeTimeSlot.where(employee_id: @employee.id).delete_all#.destroy_all
           campus_employee = CampusEmployee.where(employee_id: @employee.id).delete_all
            for i in 1..4
               r = "approved"+i.to_s
                   for j in 1..3
                      x = "day"+i.to_s
                      y = "day"+i.to_s+"_start_time"+j.to_s
                      z = "day"+i.to_s+"_end_time"+j.to_s
                      a = params[x]
                      b = params[y]
                      c = params[z]
                      d = "location_id_"+i.to_s
                          if (a != "") && (b != "") && (c !=  "") && (d !=  "")
                             # binding.pry
                             # timeslot.start_time = a 
                             # timeslot.end_time = b 
                             # timeslot.days = c 
                             # timeslot.semester = params[:semester]
                             # timeslot.location_id = location_id
                             timeslot =Timeslot.create(start_time: b, end_time: c, days: a, semester: params[:semester], location_id: params[d].to_i, approved: params[r])
                             EmployeeTimeSlot.create(employee_id: @employee.id, timeslot_id: Timeslot.find_by(start_time:b, end_time:c, days: a, location_id:params[d].to_i).id)
                  
                             CampusEmployee.create(employee_id: @employee.id, location_id: params[d].to_i)
                      # binding.pry
                           end
                      end 
          end
          redirect_to "/" 
      end
      def create
          @semesters = ["fall","spring", "summer", "other"]
          @employee = Employee.find_by(id:params[:employee_id])
          # binding.pry
            for i in 1..4
                      x = "day"+i.to_s
                   for j in 1..3
                      y = "day"+i.to_s+"_start_time"+j.to_s
                      z = "day"+i.to_s+"_end_time"+j.to_s
                      a = params[x]
                      b = params[y]
                      c = params[z]
                      # binding.pry
                          if (a != "") && (b != "") && (c !=  "")
                             location_id = "location_id_#{i}"
                             # binding.pry
                            timeslot = Timeslot.create(start_time: b, end_time: c, days: a,semester: params[:semester], location_id: params[location_id])
                        
                         timeslot_id = timeslot.id
                             EmployeeTimeSlot.create(employee_id: @employee.id, timeslot_id: timeslot_id)
              
                             CampusEmployee.create(employee_id: @employee.id, location_id: params[location_id])
                          end
                end
          end
          redirect_to "/" 
      end

    def delete
    end
end
