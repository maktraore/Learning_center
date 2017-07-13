class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  helper_method :current_student
  # before_action :authenticate_user

  def current_user
     if session[:employee_id]
      @current_user ||= Employee.find_by(id: session[:employee_id])
     end
  end
  def current_student
     if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
     end
  end
  def authenticate_all
      redirect_to "/login" unless current_user || current_student

    # if current_user  
    #   redirect_to "/messages" 
    # else
    #    redirect_to "/login" 
    # end
  end
  def authenticate_user
    redirect_to "/login" unless current_user
  end
  def authenticate_student
    redirect_to "/students/login" unless current_student
  end

 def authenticate_admin!
   unless current_user && current_user.admin
    flash[:warning] = "You don't have that right"
    redirect_to "/login"
   end
 end
end
