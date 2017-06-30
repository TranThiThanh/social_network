class Post < ApplicationRecord
  belongs_to :user
  has_one :like, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :image
  has_many :video
  has_one :location
end
