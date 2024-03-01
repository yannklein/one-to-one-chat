# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ChatroomUser.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

yann = User.create(email: "yann@lewagon.org", nickname: "Yann", password: "123456")
luc = User.create(email: "luc@lewagon.org", nickname: "Luc", password: "123456")
chatroom = Chatroom.create(name: "general")

ChatroomUser.create(user: yann, chatroom: chatroom)
ChatroomUser.create(user: luc, chatroom: chatroom)


