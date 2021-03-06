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
          if chatroom
            redirect_to "/rooms/#{chatroom.id}"
          else
              chatroom2 = Chatroom.create(
              user_id: current_student.id,
              employee_id: params[:employee_id]
              )
              redirect_to "/rooms/#{chatroom2.id}"
          end
     else
       redirect_to "/students/login"  
     end

   end
end
