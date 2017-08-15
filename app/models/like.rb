class Like < ApplicationRecord
  belongs_to :user, class_name: Post.name, foreign_key: "id"
  belongs_to :post
  belongs_to :comment, class_name: Comment.name, foreign_key: "id"

  validates :user_id, presence: true
  validates :post_id, presence: true
end
