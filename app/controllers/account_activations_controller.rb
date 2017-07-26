class AccountActivationsController < ApplicationController
   def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update(activated: true)
      user.update(activated_at: Time.zone.now)

      redirect_to "/students/signup"
      flash[:success] = "Account activated!"
    else
      flash[:danger] = "Invalid activation link"
      redirect_to "/"
    end
  end
end
