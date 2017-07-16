class MessagesController < ApplicationController
  before_action :authenticate_all, only: :index
  def create
    @message = Message.new(
      body: params[:body], 
      user_id: current_user, 
      chatroom_id: params[:chatroom_id]
      )
    if @message.save
      ActionCable.server.broadcast "room_channel", 
      content: @message.body, 
      username: @message.user.name
    end
    render 'messages#index'

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
