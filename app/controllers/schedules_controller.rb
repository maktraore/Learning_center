  class SchedulesController < ApplicationController
      def index
          @employee = Employee.find_by(id:params[:employee_id])
        @locations = Location.all
        @semesters = ["fall","spring", "summer", "other"]
      end
      def edit
        @employee= Employee.find_by(id: params[:employee_id])
        @locations = Location.all
        @semesters = ["fall","spring", "summer", "other"]
        @time = Timeslot.find_by(id: params[:id])
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
           timeslot = Timeslot.find_by(id: params[])
          # binding.pry
            for i in 1..4
                   for j in 1..3
                      x = "day"+i.to_s
                      y = "day"+i.to_s+"_start_time"+j.to_s
                      z = "day"+i.to_s+"_end_time"+j.to_s
                      a = params[x]
                      b = params[y]
                      c = params[z]
                      # binding.pry
                          # if (a != "") && (b != "") && (c !=  "")
                             # binding.pry
                             location_id = "location_id_#{i}"
                             timeslot.start_time = a 
                             timeslot.end_time = b 
                             timeslot.days = c 
                             timeslot.semester = params[:semester]
                             timeslot.location_id = location_id

                             EmployeeTimeSlot.update(employee_id: @employee.id, timeslot_id: timeslot.id)
                  
                             CampusEmployee.update(employee_id: @employee.id, location_id: params[location_id])
                  
                          # end
                end
          end
          redirect_to "/" 
      end
      def create
          @semesters = ["fall","spring", "summer", "other"]
          @employee = Employee.find_by(id:params[:employee_id])
          # binding.pry
            for i in 1..4
                   for j in 1..3
                      x = "day"+i.to_s
                      y = "day"+i.to_s+"_start_time"+j.to_s
                      z = "day"+i.to_s+"_end_time"+j.to_s
                      a = params[x]
                      b = params[y]
                      c = params[z]
                      # binding.pry
                          if (a != "") && (b != "") && (c !=  "")
                             # binding.pry
                             location_id = "location_id_#{i}"
                            timeslot = Timeslot.create(start_time: b, end_time: c, days: a,semester: params[:semester], location_id: params[location_id])
                             EmployeeTimeSlot.create(employee_id: @employee.id, timeslot_id: timeslot.id)
                  
                             CampusEmployee.create(employee_id: @employee.id, location_id: params[location_id])
                          end
                end
          end
          redirect_to "/" 
      end

    def delete
    end
end
