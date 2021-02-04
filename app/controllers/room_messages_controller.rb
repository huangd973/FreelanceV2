class RoomMessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :load_entities
    


    def create
        @room_message = RoomMessage.create user: current_user, room: @room, message: params.dig(:room_message, :message)

        RoomChannel.broadcast_to @room, @room_message
        redirect_to room_path(@room)
    end
  
    protected
  
    def load_entities
        @room = Room.find params.dig(:room_message, :room_id)
    end
end
