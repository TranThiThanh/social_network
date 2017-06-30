class ChatroomUser < ApplicationRecord
  belongs_to :user, class_name: User.id
  belongs_to :chatroom, class_name: ChatRoom.id
end
