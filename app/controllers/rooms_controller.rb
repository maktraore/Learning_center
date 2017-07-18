class RoomsController < ApplicationController
  before_action :authenticate_student

  def show
    conversation1 = Chatroom.find_by(id: params[:id])
    @recipient_id = conversation1.recipient_id
    @sender_id = conversation1.sender_id
    if current_student
      redirect_to "/login" unless conversation1.sender_id == current_student.id 
    end
    conversation2 = Chatroom.find_by(recipient_id: @sender_id, sender_id: @recipient_id)
    if conversation2
    @messages = (conversation1.messages + conversation2.messages).sort_by{|msg| msg.created_at}
    else
    @messages = (conversation1.messages).sort_by{|msg| msg.created_at}
    end
  end

#   def create
#     # you get the ID of the employee you want to talk to from the url of the post request
#       if Chatroom.find_by(sender_id: current_student.id, recipient: params[:recipient_id])
#           redirect_to "/rooms/#{@conversation.id}"
#      else
#          Chatroom.create(sender_id: current_student.id, recipient_id: params[:recipient_id])
#           redirect_to "/rooms/#{@conversation.id}"
#     end
#     # the other ID is from current_user or current_student
#     # if Chatroom.where(sender_id: current_user, recipient_id: #that employee)
#     #   redirect_to # that chatroom
#     # else
#     # room = Chatroom.create(sender_id: #current user,
#     #                               recipient_id: # employee you want to talk to)
#     # redirect_to "/rooms/#{room.id}"
#     # end
#   end
end
