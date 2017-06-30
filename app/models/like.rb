class Like < ApplicationRecord
  belongs_to :user, class_name: Post.id  , foreign_key: "id"
  belongs_to :post
  belongs_to :comment, class_name: Comment.id, foreign_key: "id"
end
