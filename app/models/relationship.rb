class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.id
  belongs_to :followed, class_name: User.id
end
