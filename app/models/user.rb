class User < ApplicationRecord
  has_many :user_plants, dependent: :destroy
  has_many :plants, through: :user_plants
end
