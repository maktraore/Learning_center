class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end
  def create
    user = Employee.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    flash[:success] = "#{user.full_name} has been logged in successfully."
    redirect_to "/employees"
  else
    flash[:warning] = 'Invalid email or pasword'
    redirect_to "/login"
  end
end
  def destroy
   session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
