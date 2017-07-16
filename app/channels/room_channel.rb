class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def speak(data)
      Message.create content: data['message'], user: current_user, chatroom_id: data['chatroom_id']
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
