class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :recipient, class_name: User.name
  belongs_to :sender, class_name: User.name
end
