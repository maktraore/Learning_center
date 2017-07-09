class SessionsController < ApplicationController
    def new
      if request.path.include?("student")
         if current_student
          redirect_to "/messages" and return
        end
        @url = "/students/login"
      else
        @url = "/login"
      end
      render 'new.html.erb'
    end
    def create
      if request.path.include?("students")
         user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          flash[:success] = 'Successfully logged in!'
          redirect_to '/messages' 
        else
          flash[:warning] = 'Invalid email or password!'
          redirect_to 'students/login'
        end
      else
        employee = Employee.find_by(email: params[:email])
        if employee && employee.authenticate(params[:password])
          session[:employee_id] = employee.id 
          flash[:success] = "#{employee.full_name} has been logged in successfully."
          redirect_to "/employees"
         else
           flash[:warning] = 'Invalid email or pasword'
           redirect_to "/login"
        end
      end

      
    end
    def edit
      employee = Employee.find_by(full_name: params[:full_name], email: params[:email])
    end
    def update
      employee = Employee.find_by(email: params[:email])
      # new_password = BCrypt::Password.create(params[:newpassword])
      if params[:oldpassword] == employee.password
        employee.update(pasword: params[:newpassword])
      end
    end
    def destroy
      session[:employee_id] = nil
      session[:user_id] = nil
      flash[:success] = 'Successfully logged out!'
      redirect_to '/'
    end
end
