class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :like, class_name: Like.comment_id, foreign_key: "comment_id"
end
