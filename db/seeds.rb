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
pierre = User.create(email: "pierre@lewagon.org", nickname: "Pierre", password: "123456")
yl_chatroom = Chatroom.create(name: "yann-luc")
ChatroomUser.create(user: yann, chatroom: yl_chatroom)
ChatroomUser.create(user: luc, chatroom: yl_chatroom)

yp_chatroom = Chatroom.create(name: "yann-pierre")
ChatroomUser.create(user: yann, chatroom: yp_chatroom)
ChatroomUser.create(user: pierre, chatroom: yp_chatroom)


