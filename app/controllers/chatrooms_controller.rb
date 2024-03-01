class ChatroomsController < ApplicationController
  class ChatroomsController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
    end

    def create
      @other_user = User.find(:user_id)
      other_user_chatroom_ids = Chatroom.joins(:chatroom_users).where(chatroom_users: { user:  @other_user }).pluck(:id)
      current_user_chatroom_ids = Chatroom.joins(:chatroom_users).where(chatroom_users: { user:  current_user }).pluck(:id)
      common_chatroom_id = (other_user_chatroom_ids - current_user_chatroom_ids).first
      
      # if no common chatroom ids, create a new chatroom and chatroomusers
      if common_chatroom_id.nil?
        @chatroom = Chatroom.new(name: "#{@other_user.nickname}-#{current_user.nickname}")
        ChatroomUser.create(user: current_user, chatroom: @chatroom)
        ChatroomUser.create(user: @other_user, chatroom: @chatroom)
        #else use the exisiting chatroom
      else 
        @chatroom = Chatroom.find(common_chatroom_id)
      end
      redirect_to chatroom_path(@chatroom)
    end
  end
end
