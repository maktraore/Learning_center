class EmployeesController < ApplicationController
  # before_action :authenticate_admin!
  def index
    if params[:campus]
      @employees = Location.find_by(name:params[:campus]).employees
    elsif params[:department]
      @employees = Subject.find_by(department:params[:department]).employees
    else
      @employees=Employee.all
    end
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = EmployeesSchedulesPdf.new(@employees)
        
        send_data pdf.render, filename:"Schedules_of_tutors.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
    end
  end

  def manhattan_schedule_pdf
      respond_to do |format|
      format.html
      format.pdf do 
        pdf = ManhattanSchedulePdf.new(@employees)
        
        send_data pdf.render, filename:"Manhattan.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
   end
  end
  def bronx_schedule_pdf
      respond_to do |format|
      format.html
      format.pdf do 
        pdf = BronxSchedulePdf.new(@employees)
        
        send_data pdf.render, filename:"bronx.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
   end
  end
  def dobbs_ferry_schedule_pdf
      respond_to do |format|
      format.html
      format.pdf do 
        pdf = DobbsFerrySchedulePdf.new(@employees)
        
        send_data pdf.render, filename:"dobbs_ferry.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
   end
  end
  def york_town_schedule_pdf
      respond_to do |format|
      format.html
      format.pdf do 
        pdf = YorkTownSchedulePdf.new(@employees)
        
        send_data pdf.render, filename:"york_town.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
   end
  end
   def online_schedule_pdf
      respond_to do |format|
      format.html
      format.pdf do 
        pdf = OnlineSchedulePdf.new(@employees)
        
        send_data pdf.render, filename:"online.pdf", disposition: "inline",
                                                type: "application/pdf"
      end
   end
  end
  def show
    if current_user
    @chatrooms = current_user.chatrooms
    else
    @employee = Employee.find_by(id:params[:id])
    @current_user_photo = Photo.where(employee_id: @employee.id).last
    @locations = Location.all
    end
  end

  def new
    @subjects= Subject.all
    @employee = Employee.find_by(id:params[:id])
  end

  def edit
    @employee= Employee.find_by(id: params[:id])
    @subjects= Subject.all
    @emp_subjects_arr = @employee.subjects.order(:created_at).map{|subject| subject.department}
  end 
  def update
    @employee = Employee.find_by(email: params[:email])
    
    @employes_courses = EmployeeSubject.find_by(employee_id: params[:id], subject_id:params[:department_1])
    if @employes_courses.nil?
      EmployeeSubject.create(employee_id: params[:id], subject_id:params[:department_1], courses_tutored: params[:courses_tutored_1])
    else
      @employes_courses.update(courses_tutored: params[:courses_tutored_1])
    end
    # binding.pry
    @employee.approved = params[:approved]
    @employee.admin = params[:admin]
    @employee.full_name = params[:full_name]
    @employee.phone_number = params[:phone_number]
    @employee.bio = params[:bio]
    @employee.email = params[:email]
    @employee.save

    if params[:courses_tutored_2]
      employee_course_2 = EmployeeSubject.find_by(subject_id: params[:department_2], employee_id: params[:id])
      if employee_course_2
        employee_course_2.update(courses_tutored: params[:courses_tutored_2])
       else
         EmployeeSubject.create(employee_id: params[:id], subject_id:params[:department_2], courses_tutored: params[:courses_tutored_2])
      end
    end

    flash[:success] = "The Tutor information has been updated"
    redirect_to "/"
  end

  def create
    @employee = Employee.new(full_name: params[:name], email: params[:email], password: params[:password], phone_number: params[:phone_number], bio: params[:bio], approved: params[:approved], admin: params[:admin])
    @employee.save
    session[:employee_id] = @employee.id
    EmployeeSubject.create(employee_id: @employee.id, subject_id:  params[:department_1], courses_tutored: params[:courses_tutored_1])
    if !params[:courses_tutored_2].empty?
      EmployeeSubject.create(employee_id: @employee.id, subject_id:  params[:department_2], courses_tutored: params[:courses_tutored_2])
    end
 

        # Tell the UserMailer to send a welcome email after save
    UserMailer.welcome_email(@employee).deliver_now
 
    redirect_to "/employees" 
    
      # flash[:success] = "#{employee.name} has been sign up"
      # redirect_to "/login"
      # else
      # flash[:error] = "Please try again later"
      
  end

  def destroy
    employee_subject = EmployeeSubject.where(employee_id: params[:id])
    employee_time_slot = EmployeeTimeSlot.where(employee_id: params[:id])
    employee = Employee.find_by(id: params[:id])
    employee.destroy
    employee_subject.destroy
    employee_time_slot.destroy
  end
end
