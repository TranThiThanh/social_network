class Notification < ApplicationRecord
  belongs_to :actor, class_name: User.id
  belongs_to :recipient, class_name: User.id
end
