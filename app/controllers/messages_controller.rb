class MessagesController < ApplicationController
  before_action :authenticate_all, only: :index
  def create
    @message = Message.create(name: params[:content], user_id: current_user, chatroom_id: params[:chatroom_id])
    redirect_to chatroom_path(params[:chatroom_id])
  end

  def index
    if current_student
      gon.user_id = current_student.id
    end
    if current_user
      gon.employee_id = current_user.id
    end
  end
  def new
  end
  def send_email
   flash[:sucess]="Message sent" if Message.create(body: params[:body], email: params[:email])
redirect_to "/employees"
  end
end
