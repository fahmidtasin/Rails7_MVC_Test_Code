class Post < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_one_attached :image
end
