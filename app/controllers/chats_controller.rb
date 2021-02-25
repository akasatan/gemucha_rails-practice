class ChatsController < ApplicationController
    def show
      @user = User.find(params[:id])
      user_rooms = Chat.find_by(user_id: @user.id,room_id: rooms)
      
      unless user_rooms.nil?
          @room = user_rooms.room
          rooms = Chat.find(params[:room_id])
      else
          @room = Chat.new
          @room.save
          Chat.create(user_id: current_user.id, room_id: @room.id)
          Chat.create(user_id: @user.id, room_id: @room.id)
      end
      @chats = @room.chats
      @chat = Chat.new(room_id: @room.id)
    end
end
