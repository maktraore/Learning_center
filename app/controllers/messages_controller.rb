class MessagesController < ApplicationController
  before_action :authenticate_all, only: :index
  def create
    if current_student
      @message = Message.create(
      body: params[:body], 
      user_id: current_student.id, 
      chatroom_id: params[:chatroom_id]
      )
    else
      @message = Message.create(
      body: params[:body], 
      employee_id: current_user.id, 
      chatroom_id: params[:chatroom_id]
      )
    end  
  end

  def index
    @messages = Message.all
    if current_student
      gon.user_id = current_student.id
    end
    if current_user
      gon.employee_id = current_user.id
    end
  end
 
  def new
  end

  def new_email

  end

  def create_email
    email_hash = {body: params[:body], email: params[:email]}
    UserMailer.contact_by_email(email_hash).deliver_now
    redirect_to '/employees'
  end
end
