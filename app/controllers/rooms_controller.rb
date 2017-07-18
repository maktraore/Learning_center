class RoomsController < ApplicationController
  # def show
  #   chat = Chatroom.find_by(id: params[:id])
  #   # recipient_id = 
  # end
  # before_action :authenticate_user
  # before_action :authenticate_student
  # def index
  #   @rooms = Room.all
  # end

def show
    conversation1 = Chatroom.find_by(id: params[:id])
    recipient_id = conversation1.recipient_id
    sender_id = conversation1.sender_id
    redirect_to "/login" unless conversation1.sender_id == current_student.id 
    conversation2 = Chatroom.find_by(recipient_id: sender_id, sender_id: recipient_id)
    @messages = (conversation1.messages + conversation2.messages).sort_by{|msg| msg.created_at}
  end

  def new
  end

  def create
    room = Room.create(title: params[:title])
    redirect_to room_path(room)
  end
end
