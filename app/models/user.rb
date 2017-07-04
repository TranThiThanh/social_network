class User < ApplicationRecord
  has_many :post
  has_many :activity_log
  has_many :comment, dependent: :destroy
  has_many :like, as: :likeable, dependent: :destroy
  has_many :location
  has_many :group
  has_many :group_user
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :active_notification, class_name: "Notification", foreign_key: "actor_id", dependent: :destroy
  has_many :passive_notification, class_name:  "Notification", foreign_key: "recipient_id", dependent: :destroy
  has_many :actor, through: :active_notification, source: :actor
  has_many :recipient, through: :passive_notification, source: :recipient
  has_many :chatroom_user
  has_many :message
  has_many :active_conversation, class_name:  "Conversation", foreign_key: "recipient_id", dependent: :destroy
  has_many :passive_conversation, class_name:  "Conversation", foreign_key: "sender_id", dependent: :destroy
  has_many :recipient, through: :active_conversation, source: :recipient
  has_many :sender, through: :passive_conversation, source: :sender
  enum gender: [ :male, :female, :other ]

  before_save {email.downcase!}
  validates :username,  presence: true, length: {Settings.username}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {Settings.email},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {Settings.password}
end
