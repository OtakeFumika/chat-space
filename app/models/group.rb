class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true

  validate :error_message

  def error_message
    if name.empty?
      errors.add(:name, "グループ名が空欄です")
    end
end
