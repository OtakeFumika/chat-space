class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :group_users
  has_many :groups, through: :group_users
  accepts_nested_attributes_for :group_users, allow_destroy: true
  validates :name, presence: true, length: { minimum: 4, maximum: 20}, uniqueness: true
  validates :email, presence: true, length: {minimum: 8, maximum: 50}, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :search, -> { where('name Like(?)', "%#{params[:name]}%")}
end
