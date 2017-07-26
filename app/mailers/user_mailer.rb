class UserMailer < ApplicationMailer
  default from: 'newamericanrealty.seyba@gmail.com'#'notifications@learningcenters.com'
  def welcome_email(user)
    @employee = user 
    @url = 'http://localhost:3000/employees/new'
    mail(to: @employee.email, subject: 'Thank you for signing up for a learning center tutor account')
  end
  def survey_confirmation_email(user)
    @user = user 
    @url = 'http://localhost:3000/employees/new'
    mail(to: @user.email, subject: 'Thank you for signing up for a learning center tutor account')
  end
   def account_activation(user)
    @user = user
    mail(to: user.email, subject: "Account activation")
  end

 def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  def contact_by_email(email_hash)
    @email = email_hash[:email]
    @body = email_hash[:body]
    @url = 'http://localhost:3000/new_email'
    mail(to: "maktraore2005@yahoo.fr", subject: 'Web message')
  end
end
