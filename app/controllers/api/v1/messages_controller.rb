class Api::V1::MessagesController < ApplicationController
    def index
    @messages = Message.all
    render "index.json.jbuilder"
  end

  def show
    @message = Message.find_by(id: params[:id])
    
  end


  def create
    @message = Message.create(
      body: params[:body],
      user_id: params[:user_id],
      chatroom_id: params[:chatroom_id]
    )
    ActionCable.server.broadcast "activity_channel", {
      id: @message.id,
      body: @message.body,
      chatroom_id: @message.chatroom_id,
      created_at: @message.created_at
    }
    render "show.json.jbuilder"
  end
end
