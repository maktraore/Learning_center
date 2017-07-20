class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel#{params[:chatroom_id]}"
    # stream_from "messages"
  end

  def speak(data)
    @message = Message.create body: data['message'], user_id: data['user_id'], employee_id: data['employee_id'], chatroom_id: data['conversation_id']
    # @message = Message.create body: data['message'], user_id: data['user_id'], employee_id: data['employee_id'], chatroom_id: data['conversation_id']
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
