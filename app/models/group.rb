class Group < ApplicationRecord
  belongs_to :owner, class_name: User.name
  has_many :group_user, dependent: :destroy
  has_many :post, dependent: :destroy
  has_many :invites

  mount_uploader :avatar, Uploader
  mount_uploader :cover, Uploader
  enum privacy: {close: false, open: true}
  validates :name_group, length: {maximum: Settings.username}, presence: true
  validates :privacy, presence: true

  class << self
    def search search
      where("name_group Like :value", value: "%#{search}%")
    end
  end

  def pending_members
    GroupUser.where(role: Settings.member)
  end

end
