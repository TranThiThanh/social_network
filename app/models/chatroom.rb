class Chatroom < ApplicationRecord
  has_many :message
  has_many :message_user
end
