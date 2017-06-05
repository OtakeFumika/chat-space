class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true, length: { minimum: 4},length: { maximum: 20},uniqueness: true
  validates :email, presence: true, length: {minimum: 8},length: { maximum: 50},uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
