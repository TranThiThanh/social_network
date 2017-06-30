class Group < ApplicationRecord
  belongs_to :user, class_name: User.id
  has_many :group_user
end
