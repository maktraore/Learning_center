class UserMailer < ApplicationMailer
  default from: 'notifications@learningcenters.com'
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
end
