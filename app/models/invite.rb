class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, class_name: User.name
  belongs_to :recipient, class_name: User.name
  enum accepted: {group_request: false, member: true}
  validates_uniqueness_of :sender_id, :recipient_id
end
