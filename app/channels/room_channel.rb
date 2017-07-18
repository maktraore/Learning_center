class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel#{params[:chatroom_id]}"
    # stream_from "messages"
  end

  def speak(data)
    puts "data"
    puts "this is getting hit"
      @message = Message.create body: data['message'], user_id: data['user_id'], chatroom_id: data['conversation_id']
      puts @message
      puts "$$$$$$$$$$$"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
