class MessagesController < ApplicationController
  before_action :authenticate_student, only: :index
  def create
    @message = Message.create(name: params[:content], user_id: current_user, chatroom_id: params[:chatroom_id])
    redirect_to chatroom_path(params[:chatroom_id])
  end

  def index
    if current_student
      gon.user_id = current_student.id
    end
  end
end
