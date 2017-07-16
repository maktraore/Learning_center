class Api::V1::ChatroomsController < ApplicationController
    def index
    @chats = Chatroom.all
    render "index.json.jbuilder"
  end

  def show
    chat = Chatroom.find_by(id: params[:id])
    if chat.user_id
      @name = chat.user.name
    else
      @name = chat.employee.full_name
    end
    
  end

  def create
    @chat = Chatroom.create(
      body: params[:body],
      user_id: params[:user_id],
      employee_id: params[:employee_id],
    )
      if @chat.user_id
      @name = @chat.user.name
    else
      @name = @chat.employee.full_name
    end
    ActionCable.server.broadcast "activity_channel", {
      id: @chat.id,
      body: @chat.body,
      chatroom_id: @chat.chatroom_id,
      created_at: @chat.created_at
    }
    render "show.json.jbuilder"
  end
end
