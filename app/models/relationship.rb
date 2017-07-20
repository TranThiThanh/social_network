class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :follower_id, presence: true, uniqueness: {scope: :followed_id}
  validates :followed_id, presence: true, uniqueness: {scope: :follower_id}

  enum accepted: {status_request: false, friend: true}

  def accept_friend_request
    update_attribute :accepted, true
  end
end
