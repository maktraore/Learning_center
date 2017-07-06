class SessionsController < ApplicationController
    def new
        render 'new.html.erb'
      end
    def create
        user = Employee.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        session[:employee_id] = user.id 
        flash[:success] = "#{user.full_name} has been logged in successfully."
        redirect_to "/employees"
       else
        flash[:warning] = 'Invalid email or pasword'
        redirect_to "/login"
       end
    end
    def edit
      user = Employee.find_by(full_name: params[:full_name], email: params[:email])
    end
    def update
      user = Employee.find_by(email: params[:email])
      # new_password = BCrypt::Password.create(params[:newpassword])
      if params[:oldpassword] == user.password
        user.update(pasword: params[:newpassword])
      end
    end
    def destroy
       session[:employee_id] = nil
        flash[:success] = 'Successfully logged out!'
        redirect_to '/login'
    end
end
