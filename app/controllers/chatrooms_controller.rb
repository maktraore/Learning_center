class ChatroomsController < ApplicationController
  def index
  end

   def show
    @chatroom = Chatroom.find_by(id: params[:id])
    if current_student
    @messages = Message.where(chatroom_id: @chatroom.id, tutor_id: @chatroom.employee.id, user_id: current_student.id)
    elsif current_user
    @messages = Message.where(chatroom_id: @chatroom.id, tutor_id: @chatroom.employee.id, employee_id: current_user.id)
    else
      redirect_to "/login"
    end

  end

  def create
    if current_student
      chatroom = Chatroom.find_by(
        user_id: current_student.id,
        employee_id: params[:employee_id]
        )
    else
      chatroom = Chatroom.find_by(
        user_id: params[:user_id],
        employee_id: current_user.id
        )
      end

      if chatroom
        @chatroom = chatroom
      else
        if current_student
          Chatroom.create(
          user_id: current_student.id,
          employee_id: params[:employee_id]
          )
        else
          chatroom = Chatroom.create(
            user_id: params[:user_id],
            employee_id: current_user.id
            )
        end
      end
    redirect_to "/chatrooms/#{@chatroom.id}"
  end
end
