class RoomsController < ApplicationController
  # before_action :authenticate_student
  # before_action :authenticate_user
  before_action :authenticate_all
  def index
    render :show
  end

  def show
    if current_user || current_student
      @chatrooms_employee = current_user.chatrooms if current_user
      @chatrooms_students = current_student.chatrooms if current_student
    end
    conversation1 = Chatroom.find_by(id: params[:id])
    @messages = (conversation1.messages).sort_by{|msg| msg.created_at}
  end
end
