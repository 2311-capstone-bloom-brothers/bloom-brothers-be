class User < ApplicationRecord
  has_many :user_plants, dependent: :destroy
  has_many :plants, through: :user_plants

  validates :email, presence: true
  validates :location, presence: true
  validates_presence_of :password
  has_secure_password
end
