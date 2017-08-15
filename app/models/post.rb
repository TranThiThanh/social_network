class Post < ApplicationRecord
  belongs_to :user
  has_one :like, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :image, dependent: :destroy
  has_many :video
  has_one :location
  belongs_to :group

  validates :user_id, presence: true
  validates :content, presence: true
  accepts_nested_attributes_for :image

  default_scope -> {order(created_at: :desc)}
  scope :latest_posts_by_group, ->(group) {joins(:group).
    where(groups: {id: group.id}).reorder(created_at: :desc)}

  def belongs_to?(user)
    user_id == user.id
  end
end
