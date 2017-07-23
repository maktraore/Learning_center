class Api::V1::MessagesController < ApplicationController
    def index
    @messages = Message.all
    render "index.json.jbuilder"
  end

  def show
    message = Message.find_by(id: params[:id])
    if message.user_id
      @name = message.user.name
    else
      @name = message.employee.full_name
    end
    
  end

  def create
    @message = Message.create(
      body: params[:body],
      user_id: params[:user_id],
      employee_id: params[:employee_id],
      chatroom_id: params[:chatroom_id],
      read: false
    )
      if @message.user_id
      @name = @message.user.name
    else
      @name = @message.employee.full_name
    end
    ActionCable.server.broadcast "activity_channel", {
      id: @message.id,
      body: @message.body,
      chatroom_id: @message.chatroom_id,
      read: false,
      created_at: @message.created_at
    }
    render "show.json.jbuilder"
  end

  def update
    #  if current_student
    #   gon.user_id = current_student.id
    # end
    # if current_user
    #   gon.employee_id = current_user.id
    # end
    if params[:employee_id]
      messages = Message.where(chatroom_id: params[:chatroom_id], employee_id: params[:employee_id], read:false)
    else
      messages = Message.where(chatroom_id: params[:chatroom_id], user_id: params[:student_id], read:false)
    end
    messages.update_all(read: true)
    if params[:employee_id]
      messages2 = Message.where(chatroom_id: params[:chatroom_id], employee_id: params[:employee_id], read:false)
    else
      messages2 = Message.where(chatroom_id: params[:chatroom_id], user_id: params[:student_id], read:false)
    end
    # student_messages = Message.where(chatroom_id: params[:chatroom_id], user_id: params[:user_id], read:false)
    # student_messages.update_all(read: true)
    render json: { count: messages2.count }
  end
end
