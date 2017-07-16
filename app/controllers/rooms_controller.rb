class RoomsController < ApplicationController
  def show
    chat = Chatroom.find_by(id: params[:id])
    # recipient_id = 
  end
end
