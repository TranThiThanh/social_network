class Image < ApplicationRecord
  belongs_to :post
  mount_uploader :name_image, Uploader
end
