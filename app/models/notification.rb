class Notification < ApplicationRecord
  belongs_to :actor, class_name: User.name
  belongs_to :recipient, class_name: User.name
end
