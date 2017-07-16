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
  def contact_by_email(email_hash)
    @email = email_hash
    @url = 'http://localhost:3000/new_email'
    mail(to: "newamericanrealty.seyba@gmail.com", subject: 'Web message')
  end
end
