class Location < ApplicationRecord
  belongs_to :user
  belongs_to :post, class_name: Post.id, foreign_key: "id"
end
