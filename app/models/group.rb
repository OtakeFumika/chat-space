class Group < ApplicationRecord
  has_many :group_users, foreign_key: "group_id"
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users, allow_destroy: true
  validates :name, presence: { message: "名前を入力してください"}

end
