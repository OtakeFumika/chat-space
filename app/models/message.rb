class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :text, presence: {if: 'image.blank?'}
  validates :image, presence: {if: 'text.blank?'}
end
