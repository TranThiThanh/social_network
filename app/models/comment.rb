class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :like, class_name: Like.name, foreign_key: "comment_id"

  default_scope -> { order(created_at: :asc) }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :post_id, presence: true

  def belongs_to?(user)
    user_id == user.id
  end
end
