class Friendship < ApplicationRecord
  belongs_to :follower_id, class_name: User.id
  belongs_to :followed_id, class_name: User.id
end
