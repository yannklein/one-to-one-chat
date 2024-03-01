class PagesController < ApplicationController

  def home
    @users = User.where.not(id: current_user.id)
    @chatroom = Chatroom.new
  end
end
