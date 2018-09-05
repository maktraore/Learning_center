class SessionsController < ApplicationController
  # before_update :encrypt_password
    def new
      if request.path.include?("student")
        if current_student
          redirect_to "/" and return
        end
        @url = "/students/login"
      else
        @url = "/login"
      end
      render 'new.html.erb'
    end
    def create
      if request.path.include?("students")
         user = User.find_by(email: params[:email].downcase)
         # binding.pry
         # employee = Employee.find_by(email: params[:email])
         if current_user && user.authenticate(params[:session][:password])
            if user.activated?
                session[:user_id] = user.id
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                flash[:success] = "You're already logged in as an employee"
                redirect_to "/"
           else
                message  = "Account not activated. "
                message += "Check your email for the activation link."
                flash[:warning] = message
                redirect_to root_url
            end

        elsif user && user.authenticate(params[:password]) 
          session[:user_id] = user.id
          flash[:success] = 'Successfully logged in!'
          redirect_to '/' 
        # elsif employee && employee.authenticate(params[:password])
          # session[:employee_id] = employee.id
          # flash[:success] = 'Successfully logged in!'
          # redirect_to '/messages' 
        else
            @user = User.new(email: params[:email])
            flash[:warning] = 'Invalid Tutor email or password!'
            render :new
        end
      else
        employee = Employee.find_by(email: params[:email])
        if current_student
          flash[:success] = "You're already logged in as a student"
        elsif employee && employee.authenticate(params[:password])
          session[:employee_id] = employee.id 
          flash[:success] = "#{employee.full_name} has been logged in successfully."
          redirect_to "/employees"
         else
           flash[:warning] = 'Invalid student email or pasword'
           redirect_to "/login"
        end
      end

      
    end
    def edit
      employee = Employee.find_by(email: params[:email])
    end
    # def update
      # employee = Employee.find_by(email: params[:email])
      # # new_password = BCrypt::Password.create(params[:newpassword])
      # current_password = employee.password_digest
      # if BCrypt::Password.create(params[:oldpassword] )== current_password
      #   binding.pry 
      #   employee.update(password: params[:newpassword])
      #   binding.pry
      #   flash[:success] = 'password updated'
      # else
      #   flash[:warning] = 'We were not able to update your pasword this time'
      # end
      # redirect_to '/'
      # private
      # def encrypt_password
      # unless self.password.nil?
      # self.password = BCrypt::Password.create(self.password)
      #  end
    # end
    def destroy
      if current_user
      session[:employee_id] = nil
      elsif  current_student
      session[:user_id] = nil
      end
      flash[:success] = 'Successfully logged out!'
      redirect_to '/'
    end
end
