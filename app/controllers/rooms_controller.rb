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
    @conversation1 = Chatroom.find_by(id: params[:id])
    if @conversation1.messages.length > 50
      conversation1.messages.order('created_at ASC').limit(2).destroy_all
      @messages = (@conversation1.messages).order(:created_at)
    else
      @messages = (@conversation1.messages).order(:created_at)
    end
  end
end
