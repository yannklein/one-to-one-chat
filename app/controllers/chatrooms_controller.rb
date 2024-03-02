class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @other_user = User.find(params[:user_id])
    @chatroom = Chatroom.joins(:users).where(users: [@other_user, current_user]).group(:id).having("COUNT(users.id) = 2").first

    # SQL query produced:
    # select c.id, c.name, COUNT(u.id)
    # from chatrooms c 
    # join chatroom_users cu on c.id = cu.chatroom_id 
    # join users u on cu.user_id = u.id
    # where u.id in (12, 14)
    # group by c.id
    # having COUNT(u.id) = 2

    # if no common chatroom ids, create a new chatroom and chatroomusers
    if @chatroom.nil?
      @chatroom = Chatroom.create(name: "#{@other_user.nickname}-#{current_user.nickname}")
      ChatroomUser.create(user: current_user, chatroom: @chatroom)
      ChatroomUser.create(user: @other_user, chatroom: @chatroom)
    end
    redirect_to chatroom_path(@chatroom)
  end
end
