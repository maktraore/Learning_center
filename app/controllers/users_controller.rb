class UsersController < ApplicationController
    def new
      render 'new.html.erb'
    end

    def create
      user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
      if user.save
        # session[:user_id] = user.id
        UserMailer.account_activation(user).deliver_now
        flash[:info] = "Please check your email to activate your account."
        redirect_to '/'
      else
        flash[:warning] = 'Invalid email or password!'
        redirect_to '/students/signup'
      end
    end
end
