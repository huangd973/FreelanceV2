class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_entities

    def index
        @rooms = Room.all
        @users = User.all
        user = current_user.id
        unless current_user.admin?
            @rooms = @rooms.where("client_id == :user_id or dev_id == :user_id", user_id: user)
        end
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new permitted_parameters

        if @room.save
            flash[:success] = "Room #{@room.name} was created successfully"
            redirect_to rooms_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @room.update_attributes(permitted_parameters)
            flash[:success] = "Room #{@room.name} was updated successfully"
            redirect_to rooms_path
        else
            render :new
        end
    end

    def show
        @users = User.all
        @room_message = RoomMessage.new room: @room
        @room_messages = @room.room_messages.includes(:user)
        user = current_user.id
        unless current_user.admin?
            @rooms = @rooms.where("client_id == :user_id or dev_id == :user_id", user_id: user)
        end
    end
      

    protected

    def load_entities
        @rooms = Room.all
        @room = Room.find(params[:id]) if params[:id]
    end

    def permitted_parameters
        params.require(:room).permit(:name, :client_id, :dev_id)
    end
end
