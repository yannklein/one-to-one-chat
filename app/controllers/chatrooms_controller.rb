class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @other_user = User.find(params[:user_id])
    @chatroom = Chatroom.joins(:users).where(users: [@other_user, current_user]).group(:id).having("COUNT(users.id) = 2").first

    # if no common chatroom ids, create a new chatroom and chatroomusers
    if @chatroom.nil?
      @chatroom = Chatroom.new(name: "#{@other_user.nickname}-#{current_user.nickname}")
      ChatroomUser.create(user: current_user, chatroom: @chatroom)
      ChatroomUser.create(user: @other_user, chatroom: @chatroom)
    end
    redirect_to chatroom_path(@chatroom)
  end
end
