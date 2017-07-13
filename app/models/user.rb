class User < ApplicationRecord
  attr_accessor :remember_token
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

  validates :username, length: {maximum: Settings.username}, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: Settings.password}, presence: true

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? remember_token
    return false if remember_digest.blank?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
