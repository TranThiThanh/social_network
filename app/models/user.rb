class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token

  before_save   :downcase_email
  before_create :create_activation_digest
  has_many :post
  has_many :activity_log
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy
  has_many :location
  has_many :group
  has_many :group_user
  has_many :requested_friendships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :pending_friendships, class_name: "Relationship",
    foreign_key: "followed_id",dependent: :destroy
  has_many :requested_friends, through: :requested_friendships,
    source: :followed
  has_many :pending_friends, through: :pending_friendships, source: :follower
  has_many :active_notification, class_name: "Notification", foreign_key: "actor_id", dependent: :destroy
  has_many :passive_notification, class_name: "Notification", foreign_key: "recipient_id", dependent: :destroy
  has_many :actor, through: :active_notification, source: :actor
  has_many :recipient, through: :passive_notification, source: :recipient
  has_many :chatroom_user
  has_many :message
  has_many :active_conversation, class_name: "Conversation", foreign_key: "recipient_id", dependent: :destroy
  has_many :passive_conversation, class_name: "Conversation", foreign_key: "sender_id", dependent: :destroy
  has_many :recipient, through: :active_conversation, source: :recipient
  has_many :sender, through: :passive_conversation, source: :sender

  validates :username, length: {maximum: Settings.username}, presence: true
  validates :first_name, length: {maximum: Settings.fname}, presence: true
  validates :last_name, length: {maximum: Settings.lname}, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: Settings.password}, presence: true,
    allow_nil: true
  mount_uploader :avatar, Uploader
  mount_uploader :cover, Uploader

  scope :alphabetize, -> {order(:username)}
  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

    def search search
      where("username Like :value OR phone LIKE :value OR
        first_name Like :value OR last_name LIKE :value OR email LIKE :value",
        value: "%#{search}%")
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def activate
    update_columns activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def requested_friend_requests
    requested_friendships.where(accepted: false)
  end

  def pending_friend_requests
    pending_friendships.where(accepted: false)
  end

  def destroy_friendship ex_friend
    requested_friends.delete(ex_friend) &&
      ex_friend.requested_friends.delete(self)
  end

  def find_friendship friend
    requested_friendships.find_by(followed_id: friend.id) ||
      pending_friendships.find_by(follower_id: friend.id)
  end

  def accepted? friendship
    friendship.accepted
  end

  def is_friend? user
    friendship = find_friendship(user)
    friendship.present? ? friendship.accepted? : false
  end

  def friends
    User.all.select {|user| is_friend?(user)}
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
