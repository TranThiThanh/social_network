class User < ApplicationRecord
  has_many :post
  has_many :activity_log
  has_many :comment, dependent: :destroy
  has_many :like, as: :likeable, dependent: :destroy
  has_many :location
  has_many :group
  has_many :group_user
  has_many :active_friendship, class_name: Friendship.follower_id, foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendship, class_name: Friendship.followed_id, foreign_key: "followed_id", dependent: :destroy
  has_many :follower_id, through: :active_friendship, source: :follower_id
  has_many :followed_id, through: :passive_friendship, source: :followed_id
  has_many :active_notification, class_name:  Notification.ID_actor, foreign_key: "actor_id", dependent: :destroy
  has_many :passive_notification, class_name:  Notification.ID_recipient, foreign_key: "recipient_id", dependent: :destroy
  has_many :actor, through: :active_notification, source: :actor
  has_many :recipient, through: :passive_notification, source: :recipient
  has_many :chatroom_user
  has_many :message
  has_many :active_conversation, class_name:  Conversation.recipient_id, foreign_key: "recipient_id", dependent: :destroy
  has_many :passive_conversation, class_name:  Conversation.sender_id, foreign_key: "sender_id", dependent: :destroy
  has_many :recipient, through: :active_conversation, source: :recipient
  has_many :sender, through: :passive_conversation, source: :sender
  enum gender: [ :male, :female, :other ]
end
