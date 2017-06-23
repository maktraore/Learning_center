class EmployeesController < ApplicationController
  def index
    @employees=Employee.all
  end

  def show
    @locations = Location.all
    @employee = Employee.find_by(id:params[:id])
  end

  def new
    @subjects= Subject.all
    @employee = Employee.find_by(id:params[:id])
  end

  def edit
    @subjects= Subject.all
    @employee= Employee.find_by(id: params[:id])
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
    # binding.pry
     if params[:courses_tutored_2]
       employee_course_2 = EmployeeSubject.find_by(subject_id: params[:department_2], employee_id: params[:id])
       if employee_course_2
        employee_course_2.update(courses_tutored: params[:courses_tutored_2])
      else
        EmployeeSubject.create(employee_id: params[:id], subject_id:params[:department_2], courses_tutored: params[:courses_tutored_2])
      end
     end
    @employee.email = params[:email]
    @employee.image = params[:image]
    @employee.save
     redirect_to "/"
     flash[:success] = "The Tutor information has been updated"
  end

  def create
    employee = Employee.new(full_name: params[:name], email: params[:email], password: params[:password], phone_number: params[:phone_number], bio: params[:bio], approved: params[:approved], admin: params[:admin])
           employee.save
    EmployeeSubject.create(employee_id: employee.id, subject_id:  params[:department_1], courses_tutored: params[:courses_tutored_1])
        if !params[:courses_tutored_2].empty?
            EmployeeSubject.create(employee_id: employee.id, subject_id:  params[:department_2], courses_tutored: params[:courses_tutored_2])
        end
      # session[:user_id] =employee.id
      # flash[:success] = "#{employee.name} has been sign up"
      # redirect_to "/login"
      # else
      # flash[:error] = "Please try again later"
      redirect_to "/employees"
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
